import 'package:flutter/material.dart';

class Membership {
  final String name;
  final String price;

  Membership(this.name, this.price);
}

class MembershipPlans extends StatelessWidget {
  final List<Membership> memberships = [
    Membership("1 Month", "Rs 3,000"),
    Membership("3 Months", "Rs 8,000"),
    Membership("6 Months", "Rs 13,000"),
    Membership("1 Year", "Rs 18,000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Membership Plans',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
        body: Center(
          child: MembershipCardList(memberships: memberships),
        ),
      
    );
  }
}

class MembershipCardList extends StatelessWidget {
  final List<Membership> memberships;

  MembershipCardList({required this.memberships});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: memberships.length,
        itemBuilder: (context, index) {
          return MembershipCard(
            membership: memberships[index],
          );
        },
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  final Membership membership;

  MembershipCard({required this.membership});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 49, 27, 247), const Color.fromRGBO(181, 28, 128, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0], // You can adjust these stops as needed
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
        width: 300, // Adjust the card width as needed
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                membership.name,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                membership.price,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}