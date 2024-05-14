import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navigationShell.currentIndex > 0) {
          _onTap(context, 0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: navigationShell,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 6,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontFamily: FontFamily.poppins, fontWeight: FontWeight.w500),
          selectedFontSize: 12.sp,
          unselectedFontSize: 10.sp,
          selectedItemColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Beranda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_esports_outlined), label: "Promo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined), label: "Pesan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Pengaturan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: "Keluar"),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
        ),
      ),
    );
  }

  void _onTap(context, index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}
