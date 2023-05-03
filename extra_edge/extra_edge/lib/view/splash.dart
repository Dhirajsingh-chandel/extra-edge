import 'dart:async';

import 'package:extra_edge/resource/color_manager.dart';
import 'package:extra_edge/resource/style_manager.dart';
import 'package:extra_edge/resource/value_manager.dart';
import 'package:extra_edge/view/rockets_list.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => RocketPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: getBoldStyle(color: ColorManager.black, fontSize: AppSize.s18),
        ),
      ),
    );
  }
}
