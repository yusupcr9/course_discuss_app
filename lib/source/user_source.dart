import 'dart:convert';

import 'package:course_discuss_app/config/api.dart';
import 'package:course_discuss_app/model/user.dart';
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
      print("===========");
      print(response.body);
      print("===========");
      DMethod.printTitle('User Resource - Login MASUK', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle("User Resource - Login GAGAL", e.toString());
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

  static Future<Map<String, dynamic>> stat(String idUser) async {
    String url = '${Api.user}/stat.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('User Resource - Stat', response.body);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle("User Resource - Stat", e.toString());
      return {
        "topic": 0.0,
        "follower": 0.0,
        "following": 0.0,
      };
    }
  }

  static Future<List<User>> search(String query) async {
    String url = '${Api.user}/search.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'search_quer': query,
      });
      DMethod.printTitle('User Resource - Stat', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle("User Resource - Stat", e.toString());
      return [];
    }
  }
}
