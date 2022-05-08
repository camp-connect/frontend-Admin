import 'dart:convert';

GetStudentDetailsForRegistration getStudentDetailsForRegistrationFromJson(
        String str) =>
    GetStudentDetailsForRegistration.fromJson(json.decode(str));

String getStudentDetailsForRegistrationToJson(
        GetStudentDetailsForRegistration data) =>
    json.encode(data.toJson());

class GetStudentDetailsForRegistration {
  GetStudentDetailsForRegistration({
    required this.unapprovedStudentDetails,
    required this.error,
    required this.message,
  });

  List<UnapprovedStudentDetail> unapprovedStudentDetails;
  int error;
  String message;

  factory GetStudentDetailsForRegistration.fromJson(
          Map<String, dynamic> json) =>
      GetStudentDetailsForRegistration(
        unapprovedStudentDetails: List<UnapprovedStudentDetail>.from(
            json["UnapprovedStudentDetails"]
                .map((x) => UnapprovedStudentDetail.fromJson(x))),
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "UnapprovedStudentDetails":
            List<dynamic>.from(unapprovedStudentDetails.map((x) => x.toJson())),
        "error": error,
        "message": message,
      };
}

class UnapprovedStudentDetail {
  UnapprovedStudentDetail({
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

  factory UnapprovedStudentDetail.fromJson(Map<String, dynamic> json) =>
      UnapprovedStudentDetail(
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
