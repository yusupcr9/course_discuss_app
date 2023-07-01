import 'package:course_discuss_app/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

import '../config/api.dart';
import '../model/user.dart';

class ItemUser extends StatelessWidget {
  const ItemUser({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(AppRoute.profile, extra: user);
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage('${Api.imageUser}/${user.image}'),
        radius: 18,
      ),
      horizontalTitleGap: 4,
      title: Text(user.username),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
