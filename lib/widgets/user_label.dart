import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/data/services/user_service.dart';

class UserLabel extends StatelessWidget {
  final String userId;
  final double width;
  UserLabel({super.key, required this.userId, this.width = 50});

  final UserService userService = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FutureBuilder(
        future: userService.getUser(userId),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text(
              asyncSnapshot.data?.email.toString() ?? 'none',
              overflow: TextOverflow.ellipsis,
            );
          }
        },
      ),
    );
  }
}
