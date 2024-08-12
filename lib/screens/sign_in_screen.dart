import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/button.dart';
import 'package:campus_app/widgets/glass_textformfield.dart';
import 'package:campus_app/widgets/sign_in_background.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:campus_app/cookie_storage.dart'; 

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      final response = await http.post(
        Uri.parse('https://campusapi-puce.vercel.app/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final cookies = data['Cookies'] as String;

        await CookieStorage().saveCookie(cookies);

        Navigator.pushReplacementNamed(context, '/navigationMenu');
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignInBackgroundImage(),
        Scaffold(
          backgroundColor: Colors.indigo.shade900.withOpacity(0.1),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Logo.png"),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.responsiveSize(40),
                      bottom: context.responsiveSize(10),
                      left: context.responsiveSize(40),
                      right: context.responsiveSize(40)),
                  child: GlassTextFormField(
                    controller: _emailController,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.responsiveSize(40),
                      vertical: context.responsiveSize(10)),
                  child: GlassTextFormField(
                    controller: _passwordController,
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                GradientButton(
                  title: "Sign In",
                  textStyle: context.textMedium,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                      horizontal: context.responsiveSize(40)),
                  onPressed: _signIn,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
