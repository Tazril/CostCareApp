import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cost_care/Screens/RegistrationScreen.dart';
import 'package:cost_care/utils/Buttons.dart';
import 'package:cost_care/utils/TextStyles.dart';
import 'package:cost_care/utils/Consts.dart';
import 'package:cost_care/utils/Forms.dart';

import 'Home.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: NormalText("SignIn", kblack, 20.0),
        backgroundColor: kwhite,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/long.png",
              ),
              SizedBox(
                height: 30,
              ),
              Container(width: 340.0, child: NormalForm(Icons.email, "Email")),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 340.0,
                child: PasswordForm(),
              ),
              SizedBox(
                height: 25,
              ),
              WideButton.bold("SIGN IN", () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Home();
                }));
              }, true),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: BoldText.veryBold(
                        "Forgot your Password ?", 12.5, kdarkBlue, true),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 100,
                    color: kdarkBlue,
                  ),
                  NormalText("Or Sign in with", kdarkBlue, 12.5),
                  Container(
                    height: 2,
                    width: 100,
                    color: kdarkBlue,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                FontAwesomeIcons.facebookSquare,
                color: Colors.blue.shade600,
                size: 40.0,
              ),
              SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NormalText("Don't have an account ?", kdarkBlue, 12.5),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(CupertinoPageRoute<bool>(
                        fullscreenDialog: true,
                        builder: (context) => RegistrationScreen(),
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                      ),
                      child:
                          BoldText.veryBold("Register ?", 12.5, korange, true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}