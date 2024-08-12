import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/button.dart';
import 'package:campus_app/widgets/glass_textformfield.dart';
import 'package:campus_app/widgets/sign_in_background.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:campus_app/cookie_storage.dart'; // Import your CookieStorage class

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final CookieStorage _cookieStorage = CookieStorage();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://campusapi-puce.vercel.app/api/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': email,
        'password': password,
      }),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final message = responseBody['passResponse']['message'];
      if (message == 'Sign in success') {
        // Extract cookies from the response
        final cookies = responseBody['Cookies'];
        if (cookies != null) {
          final cookiePairs = cookies.split(';');
          for (var pair in cookiePairs) {
            final keyValue = pair.split('=');
            if (keyValue.length == 2) {
              final key = keyValue[0].trim();
              final value = keyValue[1].trim();
              // Save each cookie in secure storage
              await _cookieStorage.saveCookie(key, value);
            }
          }
        }
        
        // Handle successful sign-in
        Navigator.pushReplacementNamed(context, '/navigationMenu');
      } else {
        // Handle sign-in failure
        _showErrorDialog('Sign in failed');
      }
    } else {
      _showErrorDialog('Error: ${response.statusCode}');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _signIn();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
