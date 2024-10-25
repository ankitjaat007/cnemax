import 'package:cnemax/functions/allFunctions.dart';
import 'package:cnemax/screens/splash_and_slide/slider.dart';
import 'package:cnemax/services/AppConfig.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    await AllFunctions.getallmovie(context);
    await AllFunctions.getallcinema(context);
    await AllFunctions.getalluser(context);
    Future.delayed(Duration(seconds: 2), () {
      App_Service.push_to_screen(Slider_screen(), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppConfig.applogo),
            Image.asset(AppConfig.appname)
          ],
        ),
      ),
    );
  }
}
