import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/features/login/login.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "Onboarding";
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/logo.png"),
              Image.asset(
                "assets/images/${provider.themeMode == ThemeMode.dark ? "being-creative-dark" : "being-creative"}.png",
              ),
              Text(
                "onboarding_title".tr(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: provider.colors.primaryColor(),
                ),
              ),
              Text(
                "onboarding_desc".tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: provider.colors.greyColor(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "language".tr(),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: provider.colors.primaryColor(),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('en'));
                    },
                    child: Text(
                      "english".tr(),
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('ar'));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: provider.themeMode == ThemeMode.light
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    child: Text(
                      "arabic".tr(),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: provider.colors.primaryColor(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    "theme".tr(),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: provider.colors.primaryColor(),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      provider.changeTheme(ThemeMode.light);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: provider.themeMode == ThemeMode.dark
                          ? Colors.transparent
                          : null,
                    ),
                    child: Image.asset("assets/images/sun.png"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      provider.changeTheme(ThemeMode.dark);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: provider.themeMode == ThemeMode.light
                          ? Colors.transparent
                          : null,
                    ),
                    child: Image.asset(
                      "assets/images/moon.png",
                      color: provider.themeMode == ThemeMode.dark
                          ? Colors.white
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    LoginScreen.routeName,
                    (r) => false,
                  );
                },
                child: Text(
                  "lets_start".tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
