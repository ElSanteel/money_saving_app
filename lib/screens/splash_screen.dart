import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_prefrence_session/screens/money_tracker_screen.dart';
import '../../../core/size_config.dart';
import '../service/shared_prefrence_helper.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => route());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Image.asset(
          "assets/images/money.png",
        ),
      ),
    );
  }

  dynamic route() {
    if (SharedPreferenceHelper.getData(key: "Email") == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MoneyTrackerScreen()),
      );
    }
  }
}
