import 'package:course_discuss_app/config/session.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';

class FeedFragment extends StatelessWidget {
  const FeedFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Session.clearUser();
          },
          child: Text("Logout")),
    );
  }
}
