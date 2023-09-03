class Membership {
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  String? payment;
  String? status;

  Membership({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.payment,
    this.status,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      id: json['id'],
      name: json['name'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      payment: json['payment'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'payment': payment,
      'status': status,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
