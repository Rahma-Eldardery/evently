import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/my_provider.dart';
import 'package:evently/features/login/login.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var userprovider = Provider.of<MyProvider>(context);
    var isDark = provider.themeMode == ThemeMode.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 60,
            backgroundColor: provider.colors.primaryColor(),
            child: Icon(
              Icons.person,
              size: 64,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            userprovider.userModel?.name ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            userprovider.userModel?.email ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 32),
          ProfileOptionCard(
            title: "dark_mode".tr(),
            trailing: Switch(
              value: isDark,
              activeThumbColor: Colors.white,
              activeTrackColor: provider.colors.primaryColor(),
              onChanged: (value) {
                provider.changeTheme(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
          const SizedBox(height: 16),
          ProfileOptionCard(
            title: "language".tr(),
            onTap: () {
              showLanguageSheet(context);
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: provider.colors.primaryColor(),
            ),
          ),
          const SizedBox(height: 16),
          ProfileOptionCard(
            title: "logout".tr(),
            onTap: () async {
              print(FirebaseAuth.instance.currentUser!.uid);
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (r) => false,
              );
            },
            trailing: const Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              "english".tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onTap: () {
              Navigator.pop(sheetContext);
              context.setLocale(const Locale("en"));
            },
          ),
          ListTile(
            title: Text(
              "arabic".tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            onTap: () {
              Navigator.pop(sheetContext);
              context.setLocale(const Locale("ar"));
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ProfileOptionCard extends StatelessWidget {
  final String title;
  final Widget trailing;
  final VoidCallback? onTap;

  const ProfileOptionCard({
    super.key,
    required this.title,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // The card is a light surface in both themes, so its text stays dark.
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
