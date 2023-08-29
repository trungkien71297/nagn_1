import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nagn_1/di.dart';
import 'package:nagn_1/repository/local.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(45, 49, 59, 1),
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Future<void> checkInit() async {
    var prefs = await SharedPreferences.getInstance();
    await getIt<Local>().init();
    var isInit = prefs.getBool("isInit") ?? false;
    if (!isInit) {
      // if (true) { //test save local;
      var res = await getIt<Local>().initDB();
      if (res) {
        prefs.setBool("isInit", true);
        prefs.setString("lastUpdate",
            DateFormat('yyyy-MM-dd').format(DateTime(2023, 8, 24)));
      }
    }

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).popAndPushNamed("/home");
    });
  }
}
