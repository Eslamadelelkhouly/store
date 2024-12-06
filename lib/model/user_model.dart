import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? name;
  String? userType;
  String? mobileNumber;
  UserModel({
    this.name,
    this.userType,
    this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userType': userType,
      'mobileNumber': mobileNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      mobileNumber: map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
