import 'package:mainpage_detailuser_v1/Model/Fake_User.dart';

class User {
  final String? id;
  final String? username;
  final String? pass;
  final String? phonenum;
  final String? address;
  final String? img;
  final String? dateBirth;

  User({required this.id, required this.username, required this.pass, required this.phonenum, required this.img, required this.address, required this.dateBirth});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      pass: json["pass"],
      phonenum: json["phonenum"],
      address: json["address"],
      img: json["img"],
      dateBirth: json["dateBirth"],
    );
  }
}