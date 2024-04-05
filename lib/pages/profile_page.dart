import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/toolbar.dart';
import 'package:flutter_chat_app/components/user_avatar.dart';
import 'package:flutter_chat_app/config/app_routes.dart';
import 'package:flutter_chat_app/config/app_strings.dart';
import 'package:flutter_chat_app/styles/app_colors.dart';
import 'package:flutter_chat_app/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: 'Profile',
        actions: [
          PopupMenuButton<ProfileMenu>(onSelected: (value) {
            switch (value) {
              case ProfileMenu.edit:
                Navigator.of(context).pushNamed(AppRoutes.editProfile);
                break;
              case ProfileMenu.logout:
                break;
              default:
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppColors.background,
                    ),
                    Text(AppStrings.edit),
                  ],
                ),
                value: ProfileMenu.edit,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColors.background,
                    ),
                    Text(AppStrings.logout),
                  ],
                ),
                value: ProfileMenu.logout,
              ),
            ];
          })
        ],
      ),
      body: Column(
        children: [
          UserAvatar(
            size: 90,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            AppStrings.firstName,
            style: AppText.header1,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            AppStrings.location,
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '400',
                    style: AppText.header2,
                  ),
                  Text(
                    AppStrings.followers,
                    style: AppText.subtitle3,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '800',
                    style: AppText.header2,
                  ),
                  Text(
                    AppStrings.posts,
                    style: AppText.subtitle3,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '700',
                    style: AppText.header2,
                  ),
                  Text(
                    AppStrings.following,
                    style: AppText.subtitle3,
                  )
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 24,
          )
        ],
      ),
    );
  }
}
