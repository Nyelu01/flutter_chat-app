import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/app_text_field.dart';
import 'package:flutter_chat_app/components/toolbar.dart';
import 'package:flutter_chat_app/components/user_avatar.dart';
import 'package:flutter_chat_app/config/app_strings.dart';
import 'package:flutter_chat_app/styles/app_colors.dart';

enum Gender { none, male, female }

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: AppStrings.editProfile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserAvatar(
                      size: 120,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.firstName),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.lastName),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.phoneNumber),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.location),
              SizedBox(
                height: 16,
              ),
              AppTextField(hint: AppStrings.birthday),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        AppStrings.male,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: Gender.male,
                      contentPadding: EdgeInsets.zero,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        AppStrings.female,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: Gender.female,
                      contentPadding: EdgeInsets.zero,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
