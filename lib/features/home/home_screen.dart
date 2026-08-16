import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/app_colors.dart';
import 'package:evently/features/add_event/add_event_screen.dart';
import 'package:evently/features/home/tabs/fav_tab.dart';
import 'package:evently/features/home/tabs/home_tab.dart';
import 'package:evently/features/home/tabs/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HOME";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // The bottom bar is a light surface in both themes, so it uses the light palette.
    AppColors colors = LightColor();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, AddEventScreen.routeName);
          setState(() {});
        },
        backgroundColor: colors.primaryColor(),
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white, width: 4),
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colors.primaryColor(),
          unselectedItemColor: colors.greyColor(),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: "home".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              activeIcon: const Icon(Icons.favorite),
              label: "favorite".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              activeIcon: const Icon(Icons.person),
              label: "profile".tr(),
            ),
          ],
        ),
      ),
      body: SafeArea(child: tabs[currentIndex]),
    );
  }

  List<Widget> get tabs => [HomeTab(), FavTab(), ProfileTab()];
}
