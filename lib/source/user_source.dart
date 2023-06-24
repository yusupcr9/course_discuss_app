import 'dart:convert';

import 'package:course_discuss_app/config/api.dart';
import 'package:d_method/d_method.dart';
import 'package:http/http.dart';

class UserSource {
  static Future<Map> register(String username, String password) async {
    String url = '${Api.user}/register.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User Resource - Register', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle("User Resource - Register", e.toString());
      return {"success": false};
    }
  }

  static Future<Map> login(String username, String password) async {
    String url = '${Api.user}/login.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User Resource - Login', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle("User Resource - Login", e.toString());
      return {"success": false};
    }
  }

  static Future<bool> updateImage(
    String id,
    String oldImage,
    String newImage,
    String newBase64code,
  ) async {
    String url = '${Api.user}/update_image.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'oldImage': oldImage,
        'newImage': newImage,
        'newBase64code': newBase64code,
      });
      DMethod.printTitle('User Resource - Update Image', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle("User Resource - Update Image", e.toString());
      return false;
    }
  }
}
