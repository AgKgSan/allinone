import 'dart:convert';

import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/round_button.dart';
import 'package:all_in_1/common_widget/round_icon_button.dart';
import 'package:all_in_1/common_widget/round_textfield.dart';
import 'package:all_in_1/view/login/reset_password_view.dart';
import 'package:all_in_1/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../onboarding/onboarding_view.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final email = txtEmail.text;
      final password = txtPassword.text;

      // Replace with your API URL
      final url = Uri.parse('http://127.0.0.1:8000/api/login');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Handle successful login
        print('Login successful: ${response.body}');
      } else {
        final errors = responseBody['errors'] as Map<String, dynamic>?;
        final firstErrorKey = errors!.keys.first;
        final firstErrorMessage = errors[firstErrorKey][0];

        setState(() {
          _errorMessage = firstErrorMessage ?? 'Login failed';
        });
        // Show an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

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
                "Login",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Add your details to Login",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RoundTextfield(
                        hintText: "Your Email",
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundTextfield(
                        hintText: "Password",
                        controller: txtPassword,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      RoundButton(
                        title: "Login",
                        onpressed: _login,
                      ),
                    ],
                  )),

              const SizedBox(
                height: 4,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordView(),
                    ),
                  );
                },
                child: Text(
                  "Forgot your Password?",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "or Login With",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // RoundIconButton(
              //   title: "Login with Facebook",
              //   icon: "assets/img/facebook_logo.png",
              //   color: Color(0xff367FC0),
              //   onPressed: () {},
              // ),

              const SizedBox(
                height: 25,
              ),
              RoundIconButton(
                title: "Login with Google",
                icon: "assets/img/google_logo.png",
                color: TColor.primary,
                onPressed: () {},
              ),

              const SizedBox(
                height: 80,
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Sign Up",
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
