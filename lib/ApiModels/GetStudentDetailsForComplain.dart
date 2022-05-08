// To parse this JSON data, do
//
//     final getStudentDetailsForComplain = getStudentDetailsForComplainFromJson(jsonString);

import 'dart:convert';

GetStudentDetailsForComplain getStudentDetailsForComplainFromJson(String str) =>
    GetStudentDetailsForComplain.fromJson(json.decode(str));

String getStudentDetailsForComplainToJson(GetStudentDetailsForComplain data) =>
    json.encode(data.toJson());

class GetStudentDetailsForComplain {
  GetStudentDetailsForComplain({
    required this.unresolvedComplaint,
    required this.error,
    required this.message,
  });

  List<UnresolvedComplaint> unresolvedComplaint;
  int error;
  String message;

  factory GetStudentDetailsForComplain.fromJson(Map<String, dynamic> json) =>
      GetStudentDetailsForComplain(
        unresolvedComplaint: List<UnresolvedComplaint>.from(
            json["UnresolvedComplaint"]
                .map((x) => UnresolvedComplaint.fromJson(x))),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "UnresolvedComplaint":
            List<dynamic>.from(unresolvedComplaint.map((x) => x.toJson())),
        "error": error,
        "message": message,
      };
}

class UnresolvedComplaint {
  UnresolvedComplaint({
    required this.issueId,
    required this.name,
    required this.emailId,
    required this.roomNumber,
    required this.personalContactNumber,
    required this.justifiedIssue,
  });

  String issueId;
  String name;
  String emailId;
  String roomNumber;
  String personalContactNumber;
  String justifiedIssue;

  factory UnresolvedComplaint.fromJson(Map<String, dynamic> json) =>
      UnresolvedComplaint(
        issueId: json["IssueId"],
        name: json["Name"],
        emailId: json["EmailId"],
        roomNumber: json["RoomNumber"],
        personalContactNumber: json["PersonalContactNumber"],
        justifiedIssue: json["JustifiedIssue"],
      );

  Map<String, dynamic> toJson() => {
        "IssueId": issueId,
        "Name": name,
        "EmailId": emailId,
        "RoomNumber": roomNumber,
        "PersonalContactNumber": personalContactNumber,
        "JustifiedIssue": justifiedIssue,
      };
}
