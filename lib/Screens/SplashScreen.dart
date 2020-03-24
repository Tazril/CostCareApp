import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cost_care/utils/TextStyles.dart';
import 'package:cost_care/utils/Consts.dart';

import 'BoardingView/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: korange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Icon(FontAwesomeIcons.plane,color: kwhite,size: 70,),
              Image.asset(
                "assets/logo.png",
              ),
              SizedBox(height: 50),
              BoldText("Cost Care", 35.0, kdarkBlue),
              TypewriterAnimatedTextKit(
                text: ["Compare Medical Costs..."],
                textStyle: TextStyle(
                    fontSize: 16.0, color: kwhite, fontFamily: "nunito"),
                speed: Duration(milliseconds: 150),
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return LandingPage();
      }));
    });
  }
}
