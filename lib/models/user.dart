import 'membership.dart';

class User {
  final String uid;
  String? firstName;
  String? lastName;
  String? email;
  Membership? currentMembershipPlan;
  List<Membership>? membershipHistory;
  double? height;
  int? age;
  double? weight;

  User({
    required this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.currentMembershipPlan,
    this.membershipHistory,
    this.height,
    this.age,
    this.weight,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      currentMembershipPlan: json['currentMembershipPlan'] != null
          ? Membership.fromJson(json['currentMembershipPlan'])
          : null,
      membershipHistory: json['membershipHistory'] != null
          ? (json['membershipHistory'] as List)
              .map((e) => Membership.fromJson(e))
              .toList()
          : null,
      height: json['height']?.toDouble(),
      age: json['age'],
      weight: json['weight']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'currentMembershipPlan': currentMembershipPlan?.toJson(),
      'membershipHistory': membershipHistory?.map((e) => e.toJson()).toList(),
      'height': height,
      'age': age,
      'weight': weight,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
