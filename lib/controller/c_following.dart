import 'package:course_discuss_app/source/follow_source.dart';
import 'package:flutter/foundation.dart';

import '../model/user.dart';

class CFollowing extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;
  setusers(String idUser) async {
    _users = await FollowSource.readFollowing(idUser);
    notifyListeners();
  }
}
