import 'dart:convert';

import 'package:course_discuss_app/config/api.dart';
import 'package:d_method/d_method.dart';
import 'package:http/http.dart';

class FollowSource {
  static Future<bool> checkIsFollowing(
    String fromIdUser,
    String toIdUser,
  ) async {
    String url = '${Api.follow}/check.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('Follow Resource - checkIsFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle("Follow Resource - checkIsFollowing", e.toString());
      return false;
    }
  }
}
