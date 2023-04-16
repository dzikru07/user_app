import 'package:flutter/material.dart';
import 'package:user_app/pages/dashboard/view/pages/dashboard.dart';
import 'package:user_app/pages/login_register/view/login_register.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginRegister());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardPage());
      // case '/edit':
      //   return MaterialPageRoute(builder: (_) => EditAddress());
      default:
        return MaterialPageRoute(builder: (_) => LoginRegister());
    }
  }
}
