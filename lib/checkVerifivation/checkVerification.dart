
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wait until u get verified",
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      nextPageOnly(context: context, page: EnterMobileScreen());
                    },
                    child: Text("Logout")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      nextPageOnly(context: context, page: HomePage());
                    },
                    child: Text("Refresh"))
              ],
            ),
          )
        : HomePage();
  }

  Future<bool> getVerificationStatus() async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
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
