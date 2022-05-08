// import 'dart:developer';
// import 'dart:convert';
// import 'package:admin/ApiModels/GetStudentDetailsForLogin.dart';
// import 'package:http/http.dart' as http;
//
// class LoginApiConstants {
//   static String baseUrl =
//       'https://camp-connect-backend.herokuapp.com/api/login';
//   static String usersEndpoint = 'login';
// }
//
// class LoginApi {
//   static Future<List<LoginRequestModel>?> getLoginResponse(String query) async {
//     try {
//       final url = Uri.parse(
//           LoginApiConstants.baseUrl + LoginApiConstants.usersEndpoint);
//       final response = await http.get(url);
//       final List _login = json.decode(response.body);
//       if (response.statusCode == 200) {
//         List<LoginRequestModel> _model =
//             loginModelFromJson(response.body) as List<LoginRequestModel>;
//         return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     // return Locations.map((json) => Location.fromJson(json)).where(
//     //   (location) {
//     //     final namelower = location.college.toLowerCase();
//     //     final querylower = query.toLowerCase();
//     //
//     //     return namelower.contains(querylower);
//     //   },
//     // ).toList();
//   }
// }
