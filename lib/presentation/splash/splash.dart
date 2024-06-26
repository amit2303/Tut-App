import 'dart:async';


import 'package:advance_flutter/presentation/resources/assets_manager.dart';
import 'package:advance_flutter/presentation/resources/color_manager.dart';
import 'package:advance_flutter/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startDelay(){
    _timer=Timer(Duration(seconds: 2),_goNext);

  }

  void _goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    _timer?.cancel();
    // TODO: implement initState
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: ColorManager.primary,
        body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}