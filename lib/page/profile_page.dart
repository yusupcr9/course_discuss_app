import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../config/api.dart';
import '../model/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Image.network(
              '${Api.imageUser}/${user.image}',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
