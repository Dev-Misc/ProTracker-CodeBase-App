import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scretask/app/routes/api.routes.dart';

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
    'Authorization': "test"
  };
  Future createAccount({
    required String useremail,
    required String username,
    required String userphoto,
    required String secretcode,
    required String secretcodeinput,
    required String userpassword,
  }) async {
    const subUrl = '/auth/signup';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "useremail": useremail,
          "userpassword": userpassword,
          "username": username,
          "userphoto": userphoto,
          "secretcode": secretcode,
          "secretcodeinput": secretcodeinput,
        }));
    final dynamic body = response.body;
    return body;
  }

  Future userLogin(
      {required String useremail, required String userpassword}) async {
    const subUrl = '/auth/login';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "useremail": useremail,
          "userpassword": userpassword,
        }));
    final dynamic body = response.body;
    return body;
  }

  Future sendEmail({required String useremail}) async {
    const subUrl = '/auth/send-email-verification';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "useremail": useremail,
        }));
    final dynamic body = response.body;
    return body;
  }

  Future sendGroupEmail({
    required String useremail,
    required String grpName,
    required String byAdmin,
  }) async {
    const subUrl = '/auth/send-request-grp';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode(
            {"useremail": useremail, "grpName": grpName, "byAdmin": byAdmin}));
    final dynamic body = response.body;
    return body;
  }

  Future sendFeedback({
    required String title,
    required String desc,
    required String addedBy,
  }) async {
    const subUrl = '/auth/send-feeback';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({"title": title, "desc": desc, "addedBy": addedBy}));
    final dynamic body = response.body;
    return body;
  }
}
