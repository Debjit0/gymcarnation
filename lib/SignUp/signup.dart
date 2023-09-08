import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/checkVerifivation/checkVerification.dart';
import 'package:gymcarnation/utils/routers.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';
  double _height = 0.0;
  double _weight = 0.0;
  String _sex = '';
  String uid=FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up',style: Theme.of(context).textTheme.titleSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Name',),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more email validation logic here if needed.
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // You can add more phone number validation logic here if needed.
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Height (in cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your height';
                  }
                  // You can add more height validation logic here if needed.
                  return null;
                },
                onSaved: (value) {
                  _height = double.parse(value!);
                },
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(labelText: 'Weight (in kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your weight';
                  }
                  // You can add more weight validation logic here if needed.
                  return null;
                },
                onSaved: (value) {
                  _weight = double.parse(value!);
                },
              ),
              /*DropdownButtonFormField<String>(
                value: _sex,
                items: ['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _sex = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Sex'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select your sex';
                  }
                  return null;
                },
              ),*/
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: ()async {
                  CollectionReference userCollection = firestore.collection("Users");
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the form data here, e.g., submit it to a database.
                    print('Name: $_name');
                    print('Email: $_email');
                    print('Phone: $_phone');
                    print('Height: $_height cm');
                    print('Weight: $_weight kg');
                    print('Sex: $_sex');

                    
                    final data={
                      'uid':uid,
                      'name': _name,
                      'email:': _email,
                      'phone:' :_phone,
                      'height:':' $_height cm',
                      'weight:': '$_weight kg',
                      'sex':' $_sex',
                      'isverified':false
                    };

                    await userCollection.doc(uid).set(data).whenComplete(() {nextPageOnly(context: context,page: CheckVerification());});
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}