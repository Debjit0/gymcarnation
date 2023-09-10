import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymcarnation/Membership%20Plans/membershipPlans.dart';
import 'package:gymcarnation/utils/routers.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String subscriptionMessage = "";

  @override
  void initState() {
    // TODO: implement initState
    checkMembership().then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Your Membership',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Payment History',
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Your Cards',
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  nextPage(context: context, page: MembershipPlans());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.card_membership_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Membership plans',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Logout',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 180,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => Container(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Renew Membership',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(subscriptionMessage),
            const SizedBox(height: 16),
            Text(
              '4 Days',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Validity till 12/04/2023'),
          ],
        ),
      ),
    );
  }

  checkMembership() async {
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (document['subscription'] == "NA") {
      subscriptionMessage = "You are not subscribed to any plan";
    } else if (document['subscription'] == "1M3K") {
      subscriptionMessage = "You are subscribed to the 1 Month Plan";
    } else if (document['subscription'] == "3M8K") {
      subscriptionMessage = "You are subscribed to the 3 Months Plan";
    } else if (document['subscription'] == "6M13K") {
      subscriptionMessage = "You are subscribed to the 6 Months Plan";
    } else if (document['subscription'] == "1Y18K") {
      subscriptionMessage = "You are subscribed to the 3 Months Plan";
    }
  }
}
