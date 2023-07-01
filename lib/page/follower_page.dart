import 'package:course_discuss_app/controller/c_follower.dart';
import 'package:course_discuss_app/widget/item_user.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class FollowerPage extends StatelessWidget {
  const FollowerPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    context.read<CFollower>().setusers(user.id);
    return Scaffold(
      appBar: DView.appBarLeft("${user.username}'s follower"),
      body: Consumer<CFollower>(builder: (contextConsumer, _, child) {
        if (_.users.isEmpty) return DView.empty();
        return ListView.builder(
            itemCount: _.users.length,
            itemBuilder: (context, index) {
              return ItemUser(user: _.users[index]);
            });
      }),
    );
  }
}
