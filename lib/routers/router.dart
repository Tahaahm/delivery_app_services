// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_app_delivery/cart/cart_page.dart';
import 'package:perfect_app_delivery/home_pages.dart';
import 'package:perfect_app_delivery/pages/intro_page.dart/intro_detial.dart';
import 'package:perfect_app_delivery/pages/intro_page.dart/intro_page.dart';
import 'package:perfect_app_delivery/pages/location/location_page.dart';
import 'package:perfect_app_delivery/pages/login_page/login_page.dart';
import 'package:perfect_app_delivery/pages/main_page.dart';
import 'package:perfect_app_delivery/screen_details/discount_product.dart';
import 'package:perfect_app_delivery/screen_details/popular_product_detials.dart';
import 'package:perfect_app_delivery/screen_details/recommended_product_detial.dart';

class RouterHelper {
  static const String init = "/";
  static const String mainPage = "/main-page";
  static const String popularFood = "/popular-food";
  static const String recommendFood = "/recommend-food";
  static const String cartPage = "/cart-page";
  static const String introPage = "/intro-page";
  static const String loginPage = "/login-page";
  static const String localtionPage = "/localtion-page";
  static const String discountPage = "/discount-page";
  static const String introDetails = "/intro-detial";

  //get

  static String getInit() => "$init";
  static String getIntroPage() => "$introPage";
  static String getMainPage() => "$mainPage";
  static String getpopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getrecommendFood(int pageId, String page) =>
      "$recommendFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";
  static String getLoginPage() => "$loginPage";
  static String getLocationPage() => "$localtionPage";
  static String getDiscountPage(int pageId, String page) =>
      "$discountPage?pageId=$pageId&page=$page";
  static String getIntroDetial() => "$introDetails";

  static List<GetPage> router() => [
        GetPage(
            name: init,
            page: () {
              return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return HomePage();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  }
                  return LoginPage();
                },
              );
            }),
        GetPage(
          name: mainPage,
          page: () => MainPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: popularFood,
          page: () {
            var pageId = Get.parameters['pageId'];
            var page = Get.parameters['page'];
            return PopularFoodDetail(
                pageId: int.parse(
                  pageId!,
                ),
                page: page!);
          },
          transition: Transition.fadeIn,
        ),
        GetPage(
            name: recommendFood,
            page: () {
              var pageId = Get.parameters['pageId'];
              var page = Get.parameters['page'];
              return RecommendFoodDetails(
                page: page!,
                pageId: int.parse(pageId!),
              );
            },
            transition: Transition.fadeIn),
        GetPage(
          name: cartPage,
          page: () => CartPage(),
          transition: Transition.fadeIn,
        ),
        //locationPage
        GetPage(name: localtionPage, page: () => LocationPage()),
        //recommededPage

        GetPage(
          name: introPage,
          transition: Transition.fadeIn,
          page: () => IntroPage(),
        ),
        GetPage(
          name: loginPage,
          page: () => LoginPage(),
        ),
        GetPage(
            name: discountPage,
            page: () {
              var page = Get.parameters['page'];
              var pageId = Get.parameters['pageId'];
              return DiscountPage(
                pageId: int.parse(pageId!),
                page: page!,
              );
            }),
        GetPage(name: introDetails, page: () => IntroDetail())
      ];
}
/* return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return HomePage();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    );
                  }
                  return LoginPage();
                },
              ); */


                     /*return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return MainPage();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  );
                }
                return LoginPage();
              },),); */