// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_app_delivery/cart/cart_history.dart';
import 'package:perfect_app_delivery/constant/colors.dart';
import 'package:perfect_app_delivery/pages/favorite_page.dart';
import 'package:perfect_app_delivery/pages/main_page.dart';
import 'package:perfect_app_delivery/pages/search/search_page.dart';
import 'package:perfect_app_delivery/pages/settings/setting_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages() {
    return [
      MainPage(),
      FavoriteFood(),
      SearchPage(),
      SettingPage(),
      CartHistory()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColor.buttonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Favorite"),
        activeColorPrimary: AppColor.buttonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.search,
          color: Colors.white,
        ),
        title: ("Search"),
        activeColorPrimary: AppColor.buttonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: AppColor.buttonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: AppColor.buttonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: pages(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages,
  //     // bottomNavigationBar: BottomNavigationBar(
  //     //     showUnselectedLabels: false,
  //     //     showSelectedLabels: false,
  //     //     currentIndex: currentIndex,
  //     //     onTap: (value) {
  //     //       setState(() {
  //     //         currentIndex = value;
  //     //       });
  //     //     },
  //     //     unselectedItemColor: Colors.black,
  //     //     selectedItemColor: AppColor.buttonColor,
  //     //     // ignore: prefer_const_literals_to_create_immutables
  //     //     items: [
  //     //       BottomNavigationBarItem(
  //     //         label: "Home",
  //     //         icon: Icon(Icons.home),
  //     //       ),
  //     //       BottomNavigationBarItem(
  //     //         label: "Favorite",
  //     //         icon: Icon(Icons.favorite),
  //     //       ),
  //     //       BottomNavigationBarItem(
  //     //         label: "Home",
  //     //         icon: Icon(Icons.search),
  //     //       ),
  //     //       BottomNavigationBarItem(
  //     //         label: "Home",
  //     //         icon: Icon(Icons.notifications_sharp),
  //     //       ),
  //     //       BottomNavigationBarItem(
  //     //         label: "Home",
  //     //         icon: Icon(Icons.shopping_cart_checkout_outlined),
  //     //       ),
  //     //     ])
  //     bottomNavigationBar: PersistentTabView(
  //       context,
  //       controller: _controller,
  //       screens: pages(),
  //       items: _navBarsItems(),
  //       confineInSafeArea: true,
  //       backgroundColor: Colors.white, // Default is Colors.white.
  //       handleAndroidBackButtonPress: true, // Default is true.
  //       resizeToAvoidBottomInset:
  //           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //       stateManagement: true, // Default is true.
  //       hideNavigationBarWhenKeyboardShows:
  //           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //       decoration: NavBarDecoration(
  //         borderRadius: BorderRadius.circular(10.0),
  //         colorBehindNavBar: Colors.white,
  //       ),
  //       popAllScreensOnTapOfSelectedTab: true,
  //       popActionScreens: PopActionScreensType.all,
  //       itemAnimationProperties: ItemAnimationProperties(
  //         // Navigation Bar's items animation properties.
  //         duration: Duration(milliseconds: 200),
  //         curve: Curves.ease,
  //       ),
  //       screenTransitionAnimation: ScreenTransitionAnimation(
  //         // Screen transition animation on change of selected tab.
  //         animateTabTransition: true,
  //         curve: Curves.ease,
  //         duration: Duration(milliseconds: 200),
  //       ),
  //       navBarStyle:
  //           NavBarStyle.style1, // Choose the nav bar style with this property.
  //     ),
  //   );
  // }