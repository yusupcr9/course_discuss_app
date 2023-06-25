import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_route.dart';
import '../config/session.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DView.appBarCenter('Home'),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Session.clearUser();
              context.go(AppRoute.login);
            },
            child: const Text("Logout")),
      ),
    );
  }
}
