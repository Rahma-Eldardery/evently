import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/firebase_functions.dart';
import 'package:evently/core/validators.dart';
import 'package:evently/core/widgets/auth_redirect_text.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/core/widgets/or_divider.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/login/login.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "register";
  RegisterScreen({super.key});

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var rePassword = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(height: 48),
                  Text(
                    "create_account".tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: provider.colors.primaryColor(),
                      fontSize: 24,
                    ),
                  ),

                  SizedBox(height: 24),

                  CustomTextFormField(
                    hintText: "name_hint".tr(),
                    controller: name,
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: provider.colors.greyColor(),
                    ),
                    keyboardType: TextInputType.name,
                    validator: Validators.name,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: "email_hint".tr(),
                    controller: email,

                    prefixIcon: Image.asset("assets/images/sms.png"),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: "password_hint".tr(),
                    controller: password,
                    prefixIcon: Image.asset("assets/images/lock.png"),
                    isPassword: true,
                    validator: Validators.newPassword,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: "confirm_password_hint".tr(),
                    prefixIcon: Image.asset("assets/images/lock.png"),
                    isPassword: true,
                    validator: (value) =>
                        Validators.confirmPassword(value, password.text),
                    controller: rePassword,
                  ),

                  SizedBox(height: 48),

                  CustomElevatedButton(
                    text: "sign_up".tr(),
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      FirebaseFunctions.register(
                        name.text.trim(),
                        email.text.trim(),
                        password.text,
                        () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginScreen.routeName,
                            (_) => false,
                          );
                        },
                        (message) {
                          Fluttertoast.showToast(
                            msg: message,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                      );
                    },
                  ),

                  SizedBox(height: 24),

                  AuthRedirectText(
                    message: "already_have_account".tr(),
                    actionText: "login".tr(),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  SizedBox(height: 32),

                  OrDivider(),

                  SizedBox(height: 18),

                  CustomElevatedButton(
                    text: "sign_up_google".tr(),
                    backgroundColor: Colors.white,
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    icon: Image.asset("assets/images/image 6.png"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.routeName,
                        (r) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
