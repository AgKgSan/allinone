import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/round_button.dart';
import 'package:all_in_1/view/login/login_view.dart';
import 'package:all_in_1/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //For Top Shape
              // Image.asset(
              //   "assets/img/welcome_top_shape.jpg",
              //   width: media.width,
              // ),
              
              
              Image.asset(
                "assets/img/logo.PNG",
                width: media.width ,
                height: media.height*0.6,
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(
            height: media.height * 0.05,
          ),

          Text(
                  "Welcome to our All In One Food Delivery Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
          SizedBox(
            height: media.width * 0.1 ,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "Login",
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginView()));
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "Create an Account",
              type: RoundButtonType.textPrimary,
              onpressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpView()));
              
              },
            ),
          ),
        ],
      ),
    );
  }
}
