import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? email;
  String? userType;
  String? name;
  UserModel({
    this.email,
    this.userType,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userType': userType,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
