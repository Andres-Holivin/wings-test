import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wings/screens/check_out_screen.dart';
import 'package:wings/screens/detail_product_screen.dart';
import 'package:wings/screens/home_screen.dart';
import 'package:wings/screens/sing_in_screen.dart';

class Routes {
  static final router = FluroRouter();

  static var singInRouter = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return const SingInScreen();
  });

  static var homeRouter = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeScreen();
  });
  static var detailProductRouter = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return DetailProductScreen();
  });
  static var checkOutRouter = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return CheckOutScreen();
  });

  static dynamic defineRoutes() {
    router.define("sing_in",
        handler: singInRouter, transitionType: TransitionType.fadeIn);
    router.define("home",
        handler: homeRouter, transitionType: TransitionType.inFromLeft);
    router.define("detail_product",
        handler: detailProductRouter,
        transitionType: TransitionType.inFromLeft);
    router.define("check_out",
        handler: checkOutRouter, transitionType: TransitionType.inFromLeft);
  }
}
