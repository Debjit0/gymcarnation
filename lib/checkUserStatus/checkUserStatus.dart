import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/SignUp/signup.dart';
import 'package:gymcarnation/checkVerifivation/checkVerification.dart';
import 'package:gymcarnation/homepage/homepage.dart';
import 'package:gymcarnation/utils/routers.dart';

class CheckUserStatus extends StatefulWidget {
  CheckUserStatus({super.key, this.phone});
  String? phone;
  @override
  State<CheckUserStatus> createState() => _CheckUserStatusState();
}

class _CheckUserStatusState extends State<CheckUserStatus> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  var isPresent = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

Future<void> checkStatus() async {
  // Initialize Firebase
  // Reference to your Firestore collection
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  // Query to check for the value
  QuerySnapshot querySnapshot =
      await collectionReference.where('phone', isEqualTo: widget.phone).get();

  if (querySnapshot.docs.isNotEmpty) {
    // Value exists in the Firestore collection
    nextPageOnly(context: context, page: CheckVerification());
    print('Value exists.');
  } else {
    // Value does not exist in the Firestore collection
    print('Value does not exist.');
    nextPageOnly(context: context, page: SignUp());
  }
}
    
    /*
    for(int i=0;i<snapshot.size;i++){
      if(snapshot.docs[i]['phone']==widget.phone){
        isPresent=true;
        print('found');
        nextPage(context: context, page: HomePage());
      }
      if(isPresent==false){
        print("Not Found");
      }
    }
    */
}