import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/round_button.dart';

import 'package:all_in_1/view/home/home_view.dart';

import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class ConfirmOTPView extends StatefulWidget {
  const ConfirmOTPView({super.key});

  @override
  State<ConfirmOTPView> createState() => _ConfirmOTPViewState();
}

class _ConfirmOTPViewState extends State<ConfirmOTPView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              //LoginButton
              Text(
                "We have sent a OTP to your Mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Check your mobile number 09*******48 ",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 60,
                child: OtpPinField(
                  key: _otpPinFieldController,

                  ///in case you want to enable autoFill
                  autoFillEnable: false,

                  ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                  textInputAction: TextInputAction.done,

                  ///in case you want to change the action of keyboard
                  /// to clear the Otp pin Controller
                  onSubmit: (text) {
                    print('Entered pin is $text');

                    /// return the entered pin
                  },
                  onChange: (text) {
                    print('Enter on change pin is $text');

                    /// return the entered pin
                  },
                  onCodeChanged: (code) {
                    print('onCodeChanged  is $code');
                  },

                  /// to decorate your Otp_Pin_Field
                  otpPinFieldStyle: const OtpPinFieldStyle(
                    /// border color for inactive/unfocused Otp_Pin_Field
                    // defaultFieldBorderColor: Colors.red,

                    /// border color for active/focused Otp_Pin_Field
                    // activeFieldBorderColor: Colors.indigo,

                    /// Background Color for inactive/unfocused Otp_Pin_Field
                    // defaultFieldBackgroundColor: Colors.yellow,

                    /// Background Color for active/focused Otp_Pin_Field
                    // activeFieldBackgroundColor: Colors.cyanAccent,

                    /// Background Color for filled field pin box
                    // filledFieldBackgroundColor: Colors.green,

                    /// border Color for filled field pin box
                    // filledFieldBorderColor: Colors.green,
                    //
                    /// gradient border Color for field pin box
                    activeFieldBorderGradient: LinearGradient(
                        colors: [Colors.black, Colors.redAccent]),
                    filledFieldBorderGradient: LinearGradient(
                        colors: [Colors.green, Colors.tealAccent]),
                    defaultFieldBorderGradient:
                        LinearGradient(colors: [Colors.orange, Colors.brown]),
                  ),
                  maxLength: 4,

                  /// no of pin field
                  showCursor: true,

                  /// bool to show cursor in pin field or not
                  cursorColor: Colors.indigo,

                  /// to choose cursor color
                  upperChild: const Column(
                    children: [
                      SizedBox(height: 30),
                      Icon(Icons.flutter_dash_outlined, size: 150),
                      SizedBox(height: 20),
                    ],
                  ),
                  // middleChild: Column(
                  //   children: [
                  //     SizedBox(height: 30),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           _otpPinFieldController.currentState
                  //               ?.clearOtp(); // clear controller
                  //         },
                  //         child: Text('clear OTP')),
                  //     SizedBox(height: 10),
                  //     ElevatedButton(
                  //         onPressed: () => Navigator.push(context,
                  //             MaterialPageRoute(builder: (context) => NextPage())),
                  //         child: Text('Next Class')),
                  //     SizedBox(height: 30),
                  //   ],
                  // ),

                  ///bool which manage to show custom keyboard
                  showCustomKeyboard: false,

                  /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                  // customKeyboard: Container(),
                  ///bool which manage to show default OS keyboard
                  // showDefaultKeyboard: true,

                  /// to select cursor width
                  cursorWidth: 3,

                  /// place otp pin field according to yourself
                  mainAxisAlignment: MainAxisAlignment.center,

                  /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                  ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                  otpPinFieldDecoration:
                      OtpPinFieldDecoration.defaultPinBoxDecoration,
                ),
              ),

              SizedBox(
                height: 30,
              ),

              // RoundTextfield(
              //   hintText: " Your Email",
              //   controller: txtEmail,
              //   keyboardType: TextInputType.emailAddress,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),

              RoundButton(
                title: "Confrim",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
              ),

              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SignUpView(),
                  //   ),
                  // );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Did Received a OTP ? ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
