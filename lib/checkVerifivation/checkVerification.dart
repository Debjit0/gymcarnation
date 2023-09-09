import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/auth/enter_mobile_screen.dart';
import 'package:gymcarnation/homepage/homepage.dart';
import '../utils/routers.dart';

class CheckVerification extends StatefulWidget {
  const CheckVerification({super.key});

  @override
  State<CheckVerification> createState() => _CheckVerificationState();
}

class _CheckVerificationState extends State<CheckVerification> {
  bool conditions = false;
  bool isVerified = false;
  @override
  void initState() {
    // TODO: implement initState
    //super.initState();

    getVerificationStatus().then((value) => setState(
          () {},
        ));

    super.initState();
    //getVerificationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return conditions == false
        ? Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      nextPageOnly(context: context, page: EnterMobileScreen());
                    },
                    icon: Icon(
                      Icons.exit_to_app_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wait until you get verified by our admins.",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //nextPageOnly(context: context, page: HomePage());
                        getVerificationStatus();
                        setState(() {});
                      },
                      child: Text("Refresh"))
                ],
              ),
            ),
          )
        : HomePage();
  }

  Future<bool> getVerificationStatus() async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(document['isverified']);
    isVerified = document['isverified'];
    if (isVerified == true) {
      conditions = true;
      return true;
    } else {
      conditions = false;
      return false;
    }
  }
}
