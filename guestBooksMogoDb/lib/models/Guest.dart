import 'package:mongo_dart/mongo_dart.dart';

class Guest {
  final ObjectId? id;
  final String name;
  final String phoneNumber;
  final String email;
  final DateTime timestamp;

  Guest({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        if (id != null) '_id': id,
        'name': name,
        'message': phoneNumber,
        'email': email,
        'timestamp': timestamp,
      };

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json['_id'] as ObjectId?,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        timestamp: json['timestamp'] as DateTime,
      );

  @override
  String toString() {
    return 'ID: ${id?.toHexString() ?? 'N/A'} | Name: $name | Phone: $phoneNumber | Email: $email  | Date: ${timestamp.toLocal()}';
  }
}
