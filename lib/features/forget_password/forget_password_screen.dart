import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "forget_password";
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "forget_password".tr()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32),
              Image.asset("assets/images/change-setting.png"),
              SizedBox(height: 48),
              CustomElevatedButton(
                text: "reset_password".tr(),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
