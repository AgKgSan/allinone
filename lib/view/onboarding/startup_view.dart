import 'package:all_in_1/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {

  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 1));
    welcomePage();
  }

  void welcomePage(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=> const WelcomeView()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //For Logo
          Image.asset(
            "assets/img/logo.PNG",
            width: media.width,
            height: media.height ,
            fit: BoxFit.contain,
          ),
          //For Splash Background
          Image.asset(
            "assets/img/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
