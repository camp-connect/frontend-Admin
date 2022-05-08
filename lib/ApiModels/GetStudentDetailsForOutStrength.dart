// To parse this JSON data, do
//
//     final getStudentDetailsForOutStrength = getStudentDetailsForOutStrengthFromJson(jsonString);

import 'dart:convert';

GetStudentDetailsForOutStrength getStudentDetailsForOutStrengthFromJson(
        String str) =>
    GetStudentDetailsForOutStrength.fromJson(json.decode(str));

String getStudentDetailsForOutStrengthToJson(
        GetStudentDetailsForOutStrength data) =>
    json.encode(data.toJson());

class GetStudentDetailsForOutStrength {
  GetStudentDetailsForOutStrength({
    required this.outStudentDetails,
    required this.error,
    required this.message,
  });

  List<OutStudentDetail> outStudentDetails;
  int error;
  String message;

  factory GetStudentDetailsForOutStrength.fromJson(Map<String, dynamic> json) =>
      GetStudentDetailsForOutStrength(
        outStudentDetails: List<OutStudentDetail>.from(
            json["OutStudentDetails"].map((x) => OutStudentDetail.fromJson(x))),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "OutStudentDetails":
            List<dynamic>.from(outStudentDetails.map((x) => x.toJson())),
        "error": error,
        "message": message,
      };
}

class OutStudentDetail {
  OutStudentDetail({
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

  factory OutStudentDetail.fromJson(Map<String, dynamic> json) =>
      OutStudentDetail(
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
