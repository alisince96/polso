import 'package:auto_size_text/auto_size_text.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:polso/CommonFunctions/CommonFunctions.dart';
import 'package:polso/screens/balance_screen/balance_screen.dart';
import 'package:polso/screens/friends_screen/friends_screen.dart';
import 'package:polso/screens/homepage/homepage.dart';
import 'package:polso/screens/login/login.dart';
import 'package:polso/screens/shop_screen/shop_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  // Widget currentScreen = Settings();
  List<Widget> _screens = [
    HomePage(),
    ShopScreen(),
    BalanceScreen(),
    FriendsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    print('Current index:$_selectedIndex');
    return Stack(
      children: [
        SizedBox(
          width: deviceWidth(context),
          child: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _screens[_selectedIndex],
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: 20,
                top: 0,
                left: deviceWidth(context) * 0.08,
                right: deviceWidth(context) * 0.08),
            child: DotNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (val) {
                _selectedIndex = val;
                setState(() {});
              },
              // dotIndicatorColor: Colors.black,
              items: [
                /// Home
                DotNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/home.png',
                      scale: 3.2,
                      color: _selectedIndex == 0
                          ? Color(0xFFffc204)
                          : Color(0xFF827979),
                    ),
                    selectedColor: Color(0xFFffc204),
                    unselectedColor: Color(0xFF827979)),

                /// Likes
                DotNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/bags-shopping.png',
                      scale: 3.2,
                      color: _selectedIndex == 1
                          ? Color(0xFFffc204)
                          : Color(0xFF827979),
                    ),
                    selectedColor: Color(0xFFffc204),
                    unselectedColor: Color(0xFF827979)),

                /// Search
                DotNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/wallet.png',
                      scale: 3.2,
                      color: _selectedIndex == 2
                          ? Color(0xFFffc204)
                          : Color(0xFF827979),
                    ),
                    selectedColor: Color(0xFFffc204),
                    unselectedColor: Color(0xFF827979)),

                /// Profile
                DotNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/users.png',
                      scale: 3.2,
                      color: _selectedIndex == 3
                          ? Color(0xFFffc204)
                          : Color(0xFF827979),
                    ),
                    selectedColor: Color(0xFFffc204),
                    unselectedColor: Color(0xFF827979)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTabs(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white70,
      ),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MaterialButton(
            minWidth: 5,
            onPressed: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/home.png',
                  scale: 3.2,
                  color: _selectedIndex == 3
                      ? Color(0xFFffc204)
                      : Color(0xFF827979),
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: 5,
            onPressed: () async {
              setState(() {
                _selectedIndex = 2;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/bags-shopping.png',
                  scale: 3.2,
                  color: _selectedIndex == 2
                      ? Color(0xFFffc204)
                      : Color(0xFF827979),
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: 5,
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/wallet.png',
                  scale: 3.2,
                  color: _selectedIndex == 1
                      ? Color(0xFFffc204)
                      : Color(0xFF827979),
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          MaterialButton(
            minWidth: 5,
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/users.png',
                  scale: 3.2,
                  color: _selectedIndex == 0
                      ? Color(0xFFffc204)
                      : Color(0xFF827979),
                ),
                const SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
