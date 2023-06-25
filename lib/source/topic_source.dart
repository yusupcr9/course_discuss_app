import 'dart:convert';

import 'package:course_discuss_app/config/api.dart';
import 'package:course_discuss_app/model/topic.dart';
import 'package:d_method/d_method.dart';
import 'package:http/http.dart';

class TopicSource {
  static Future<bool> create(
    String title,
    String description,
    String images,
    String base64codes,
    String idUser,
  ) async {
    String url = '${Api.topic}/create.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'title': title,
        'description': description,
        'images': images,
        'base64codes': base64codes,
        'id_user': idUser,
      });
      DMethod.printTitle('Topic Resource - create', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle("Topic Resource - create", e.toString());
      return false;
    }
  }

  static Future<bool> update(
    String id,
    String title,
    String description,
  ) async {
    String url = '${Api.topic}/update.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'title': title,
        'description': description,
      });
      DMethod.printTitle('Topic Resource - update', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle("Topic Resource - update", e.toString());
      return false;
    }
  }

  static Future<bool> delete(
    String id,
    String images,
  ) async {
    String url = '${Api.topic}/delete.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'images': images,
      });
      DMethod.printTitle('Topic Resource - delete', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle("Topic Resource - delete", e.toString());
      return false;
    }
  }

  static Future<List<Topic>> readExplore() async {
    String url = '${Api.follow}/read_explore.php';
    try {
      Response response = await Client().get(Uri.parse(url));
      DMethod.printTitle('Follow Resource - readExplore', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle("Follow Resource - readExplore", e.toString());
      return [];
    }
  }

  static Future<List<Topic>> readFeed(
    String idUser,
  ) async {
    String url = '${Api.follow}/read_feed.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "id_user": idUser,
      });
      DMethod.printTitle('Follow Resource - readFeed', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle("Follow Resource - readFeed", e.toString());
      return [];
    }
  }

  static Future<List<Topic>> readWhereIdUser(
    String idUser,
  ) async {
    String url = '${Api.follow}/read_where_id_user.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "id_user": idUser,
      });
      DMethod.printTitle('Follow Resource - readWhereIdUser', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle("Follow Resource - readWhereIdUser", e.toString());
      return [];
    }
  }

  static Future<List<Topic>> search(
    String query,
  ) async {
    String url = '${Api.follow}/search.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        "search_query": query,
      });
      DMethod.printTitle('Follow Resource - search', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['success']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return Topic.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle("Follow Resource - search", e.toString());
      return [];
    }
  }
}
