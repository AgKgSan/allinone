import 'dart:convert';

import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/round_button.dart';

import 'package:all_in_1/view/home/home_view.dart';
import 'package:all_in_1/view/login/login_view.dart';

import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:http/http.dart' as http;

class ConfirmOTPView extends StatefulWidget {
  const ConfirmOTPView({super.key, required this.email});

  final String email;
  @override
  State<ConfirmOTPView> createState() => _ConfirmOTPViewState();
}

class _ConfirmOTPViewState extends State<ConfirmOTPView> {
  final TextEditingController _otpController = TextEditingController();
  String? _errorMessage;
  String? _successMessage;

  Future<void> _verifyOtp([String? otp]) async {
    // Replace with your API URL
    if (otp == null) {
      setState(() {
        _errorMessage = 'Please Enter OTP';
      });
    } else {
      final url = Uri.parse('http://127.0.0.1:8000/api/emailVerify');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": widget.email,
          "code": otp,
        }),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Handle successful login
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      } else {
        final errors = responseBody['errors'] as Map<String, dynamic>?;
        print(errors);
        if (errors == null) {
          setState(() {
            _errorMessage = 'Verify failed';
          });
        } else {
          final firstErrorKey = errors.keys.first;
          final firstErrorMessage = errors[firstErrorKey][0];

          setState(() {
            _errorMessage = firstErrorMessage ?? 'Verify failed';
          });
        }
        // Show an error message to the user
      }
    }
  }

  Future<void> _resentOtp() async {
    // Replace with your API URL
    final url = Uri.parse('http://127.0.0.1:8000/api/resendOtp');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": widget.email,
      }),
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // Handle successful login
      setState(() {
        _successMessage = "Opt is successfully re-sent to ${widget.email}";
      });
    } else {
      final errors = responseBody['errors'] as Map<String, dynamic>?;
      print(errors);
      if (errors == null) {
        setState(() {
          _errorMessage = 'Verify failed';
        });
      } else {
        final firstErrorKey = errors.keys.first;
        final firstErrorMessage = errors[firstErrorKey][0];

        setState(() {
          _errorMessage = firstErrorMessage ?? 'Verify failed';
        });
      }
      // Show an error message to the user
    }
  }

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
                "We have sent a OTP to your Email",
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
                "Check your email ${widget.email}",
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
                  otpPinFieldDecoration:
                      OtpPinFieldDecoration.defaultPinBoxDecoration,
                  onSubmit: (otp) => _verifyOtp(otp),
                  onChange: (value) {
                    setState(() {
                      _errorMessage = null; // Clear error message on change
                    });
                  },

                  ///in case you want to enable autoFill
                  autoFillEnable: false,

                  ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                  textInputAction: TextInputAction.done,

                  /// to decorate your Otp_Pin_Field
                  otpPinFieldStyle: const OtpPinFieldStyle(
                    activeFieldBorderGradient: LinearGradient(
                        colors: [Colors.black, Colors.redAccent]),
                    filledFieldBorderGradient: LinearGradient(
                        colors: [Colors.green, Colors.tealAccent]),
                    defaultFieldBorderGradient:
                        LinearGradient(colors: [Colors.orange, Colors.brown]),
                  ),
                  maxLength: 6,

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
                ),
              ),

              const SizedBox(
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
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    _errorMessage!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              if (_successMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    _successMessage!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              // RoundButton(title: "Confrim", onpressed: () => _verifyOtp()),

              TextButton(
                onPressed: () => _resentOtp(),
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
