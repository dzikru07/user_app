import 'package:flutter/material.dart';
import 'package:user_app/style/color.dart';

import '../../../../style/text.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Text(
          "WELCOME",
          style: homeTitleTextStyle,
        ),
      ),
    );
  }
}
