import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/post_item.dart';
import 'package:flutter_chat_app/components/toolbar.dart';
import 'package:flutter_chat_app/config/app_icons.dart';
import 'package:flutter_chat_app/config/app_routes.dart';
import 'package:flutter_chat_app/config/app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    getUsersFromServer();
    return Scaffold(
      appBar: ToolBar(
        title: AppStrings.appName,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearby);
            },
            icon: SvgPicture.asset(
              AppIcons.icLocation,
            ),
          )
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(
            user: users[index],
          );
        },
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 24,
          );
        },
      ),
    );
  }

  getUsersFromServer() {
    for (var i = 0; i < 20; i++) {
      users.add('User number $i');
    }
    return users;
  }
}
