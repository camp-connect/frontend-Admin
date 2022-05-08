// To parse this JSON data, do
//
//     final getStudentDetailsForLogin = getStudentDetailsForLoginFromJson(jsonString);

import 'dart:convert';

GetStudentDetailsForLogin getStudentDetailsForLoginFromJson(String str) =>
    GetStudentDetailsForLogin.fromJson(json.decode(str));

String getStudentDetailsForLoginToJson(GetStudentDetailsForLogin data) =>
    json.encode(data.toJson());

class GetStudentDetailsForLogin {
  GetStudentDetailsForLogin({
    required this.user,
    required this.error,
    required this.message,
  });

  User user;
  int error;
  String message;

  factory GetStudentDetailsForLogin.fromJson(Map<String, dynamic> json) =>
      GetStudentDetailsForLogin(
        user: User.fromJson(json["user"]),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "error": error,
        "message": message,
      };
}

class User {
  User({
    required this.emailId,
    required this.passwords,
    required this.name,
    required this.rollNumber,
    required this.roomNumber,
    required this.personalContactNumber,
    required this.parentsContactNumber,
    required this.mentorName,
    required this.approved,
  });

  String emailId;
  String passwords;
  String name;
  String rollNumber;
  String roomNumber;
  String personalContactNumber;
  String parentsContactNumber;
  String mentorName;
  String approved;

  factory User.fromJson(Map<String, dynamic> json) => User(
        emailId: json["EmailId"],
        passwords: json["Passwords"],
        name: json["Name"],
        rollNumber: json["RollNumber"],
        roomNumber: json["RoomNumber"],
        personalContactNumber: json["PersonalContactNumber"],
        parentsContactNumber: json["ParentsContactNumber"],
        mentorName: json["MentorName"],
        approved: json["Approved"],
      );

  Map<String, dynamic> toJson() => {
        "EmailId": emailId,
        "Passwords": passwords,
        "Name": name,
        "RollNumber": rollNumber,
        "RoomNumber": roomNumber,
        "PersonalContactNumber": personalContactNumber,
        "ParentsContactNumber": parentsContactNumber,
        "MentorName": mentorName,
        "Approved": approved,
      };
}
