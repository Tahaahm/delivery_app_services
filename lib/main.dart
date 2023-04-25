// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_app_delivery/resposbility/controllers/cart_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/desert_sweet_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/discount_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/meat_popular.dart';
import 'package:perfect_app_delivery/resposbility/controllers/popula_Controller.dart';
import 'package:perfect_app_delivery/resposbility/controllers/recommended_controller.dart';
import 'package:perfect_app_delivery/routers/router.dart';
import 'package:perfect_app_delivery/resposbility/dependinces.dart' as dep;
import 'package:firebase_core/firebase_core.dart';
import 'package:perfect_app_delivery/constant/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return GetBuilder<PopularController>(
        builder: (_) => GetBuilder<RecommendProductController>(
              builder: (_) => GetBuilder<DesertController>(
                  builder: (_) => GetBuilder<DiscountController>(
                      builder: (_) => GetBuilder<DesertSweetController>(
                          builder: (_) => GetBuilder<MeatController>(
                              builder: (_) => GetBuilder<MeatPopularController>(
                                    builder: (_) => GetMaterialApp(
                                      themeMode: ThemeMode.system,
                                      darkTheme: MyTheme.darkTheme,
                                      debugShowCheckedModeBanner: false,
                                      title: 'Delivery App',
                                      theme: MyTheme.lightTheme,
                                      //home:
                                      // ignore: prefer_const_literals_to_create_immutables
                                      getPages: RouterHelper.router(),
                                      initialRoute: RouterHelper.getIntroPage(),
                                    ),
                                  ))))),
            ));
  }
}

/*StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              RouterHelper.getInit();
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
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