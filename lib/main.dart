import 'package:flutter/material.dart';
import 'package:user_app/pages/login_register/view/login_register.dart';
import 'package:user_app/route/route.dart';
import 'package:user_app/style/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRoute _appRoute = AppRoute();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter User Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorTheme,
      ),
      home: LoginRegister(),
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }
}
