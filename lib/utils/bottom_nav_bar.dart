import 'package:CryptoWW/utils/custom_nac_bar.dart';
import 'package:CryptoWW/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:CryptoWW/pages/homePage.dart';

class bottomNavBar extends StatefulWidget {
  ///
  /// Function themeBloc for get data theme from main.dart for double theme dark and white theme
  ///
  ThemeBloc themeBloc;
  bottomNavBar({this.themeBloc});

  _bottomNavBarState createState() => _bottomNavBarState(themeBloc);
}

class _bottomNavBarState extends State<bottomNavBar> {
  ThemeBloc _themeBloc;
  _bottomNavBarState(this._themeBloc);
  int currentIndex = 0;
  bool _color = true;
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new HomePage();
        break;
      case 1:
        return new HomePage();
        break;
      case 2:
        return new HomePage();
        break;
      case 3:
        return new HomePage();
        break;
      case 4:
        return new HomePage();
        break;
      default:
        return new HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: BottomNavigationDotBar(
          // Usar -> "BottomNavigationDotBar"
          color: Theme.of(context).hintColor,
          items: <BottomNavigationDotBarItem>[
            BottomNavigationDotBarItem(
                icon: Icons.home,
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                }),
            BottomNavigationDotBarItem(
                icon: Icons.account_balance,
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                }),
            BottomNavigationDotBarItem(
                icon: Icons.account_balance_wallet,
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                }),
            BottomNavigationDotBarItem(
                icon: Icons.library_books,
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                }),
            BottomNavigationDotBarItem(
                icon: Icons.settings,
                onTap: () {
                  setState(() {
                    currentIndex = 4;
                  });
                }),
          ]),
    );
  }
}
