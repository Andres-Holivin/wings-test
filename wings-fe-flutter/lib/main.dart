import 'package:flutter/material.dart';
import 'package:wings/provider/check_out_provider.dart';
import 'package:wings/provider/home_provider.dart';
import 'package:wings/provider/login_provider.dart';
import 'package:wings/provider/product_detail_provider.dart';
import 'package:wings/routes.dart';
import 'package:wings/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Routes.defineRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<ProductDetailProvider>(
            create: (_) => ProductDetailProvider()),
        ChangeNotifierProvider<CheckOutProvider>(
            create: (_) => CheckOutProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData(),
        initialRoute: "sing_in",
        onGenerateRoute: Routes.router.generator,
      ),
    );
  }
}
