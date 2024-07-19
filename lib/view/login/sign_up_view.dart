import 'dart:convert';

import 'package:all_in_1/common/color_extension.dart';
import 'package:all_in_1/common_widget/round_button.dart';
import 'package:all_in_1/common_widget/round_textfield.dart';
import 'package:all_in_1/view/login/confirm_otp.dart';
import 'package:all_in_1/view/login/login_view.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  String? _errorMessage;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final fullname = txtName.text;
      final phoneNumber = txtMobile.text;
      final address = txtAddress.text;
      final email = txtEmail.text;
      final password = txtPassword.text;
      final confirmPassword = txtConfirmPassword.text;

      // Replace with your API URL
      final url = Uri.parse('http://127.0.0.1:8000/api/register');

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "fullname": fullname,
          "email": email,
          "phone_number": phoneNumber,
          "address": address,
          "password": password,
          "confirm_password": confirmPassword,
        }),
      );

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Handle successful login
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ConfirmOTPView(),
          ),
        );
      } else {
        final errors = responseBody['errors'] as Map<String, dynamic>?;

        if (errors == null) {
          setState(() {
            _errorMessage = 'Register failed';
          });
        } else {
          final firstErrorKey = errors.keys.first;
          final firstErrorMessage = errors[firstErrorKey][0];

          setState(() {
            _errorMessage = firstErrorMessage ?? 'Login failed';
          });
        }
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
                "Sign Up",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Add your details to Sign Up",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RoundTextfield(
                        hintText: "Name",
                        controller: txtName,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundTextfield(
                        hintText: "Phone No",
                        controller: txtMobile,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundTextfield(
                        hintText: "Address",
                        controller: txtAddress,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundTextfield(
                        hintText: " Email",
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundTextfield(
                        hintText: "Password",
                        controller: txtPassword,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundTextfield(
                        hintText: "Confirm Password",
                        controller: txtConfirmPassword,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30,
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
                        title: "Sign Up",
                        onpressed: _register,
                      ),
                    ],
                  )),

              const SizedBox(
                height: 30,
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      " Already have an account ? ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Login",
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
