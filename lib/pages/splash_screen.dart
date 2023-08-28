import 'dart:async';

import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

  Future<void> checkInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await getIt<Local>().init();
    var isInit = prefs.getBool("isInit") ?? false;
    //  if (!isInit) {
    if (true) {
      var res = await getIt<Local>().initDB();
      if (res) {
        prefs.setBool("isInit", true);
      }
    }

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).popAndPushNamed("/home");
    });
  }
}
