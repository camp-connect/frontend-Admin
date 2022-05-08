// To parse this JSON data, do
//
//     final getStudentDetailsForOutpass = getStudentDetailsForOutpassFromJson(jsonString);

import 'dart:convert';

GetStudentDetailsForOutpass getStudentDetailsForOutpassFromJson(String str) =>
    GetStudentDetailsForOutpass.fromJson(json.decode(str));

String getStudentDetailsForOutpassToJson(GetStudentDetailsForOutpass data) =>
    json.encode(data.toJson());

class GetStudentDetailsForOutpass {
  GetStudentDetailsForOutpass({
    required this.unapprovedOutPass,
    required this.error,
    required this.message,
  });

  List<UnapprovedOutPass> unapprovedOutPass;
  int error;
  String message;

  factory GetStudentDetailsForOutpass.fromJson(Map<String, dynamic> json) =>
      GetStudentDetailsForOutpass(
        unapprovedOutPass: List<UnapprovedOutPass>.from(
            json["UnapprovedOutPass"]
                .map((x) => UnapprovedOutPass.fromJson(x))),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "UnapprovedOutPass":
            List<dynamic>.from(unapprovedOutPass.map((x) => x.toJson())),
        "error": error,
        "message": message,
      };
}

class UnapprovedOutPass {
  UnapprovedOutPass({
    required this.outId,
    required this.name,
    required this.emailId,
    required this.purpose,
    required this.outTime,
    required this.inTime,
    required this.outDate,
    required this.outStatus,
    required this.parentsPermission,
    required this.approved,
  });

  String outId;
  String name;
  String emailId;
  String purpose;
  String outTime;
  String inTime;
  DateTime outDate;
  String outStatus;
  String parentsPermission;
  String approved;

  factory UnapprovedOutPass.fromJson(Map<String, dynamic> json) =>
      UnapprovedOutPass(
        outId: json["OutId"],
        name: json["Name"],
        emailId: json["EmailId"],
        purpose: json["Purpose"],
        outTime: json["OutTime"],
        inTime: json["InTime"],
        outDate: DateTime.parse(json["OutDate"]),
        outStatus: json["OutStatus"],
        parentsPermission: json["ParentsPermission"],
        approved: json["Approved"],
      );

  Map<String, dynamic> toJson() => {
        "OutId": outId,
        "Name": name,
        "EmailId": emailId,
        "Purpose": purpose,
        "OutTime": outTime,
        "InTime": inTime,
        "OutDate":
            "${outDate.year.toString().padLeft(4, '0')}-${outDate.month.toString().padLeft(2, '0')}-${outDate.day.toString().padLeft(2, '0')}",
        "OutStatus": outStatus,
        "ParentsPermission": parentsPermission,
        "Approved": approved,
      };
}
