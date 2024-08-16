// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:campus_app/providers/auth/auth_loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:campus_app/cookie_storage.dart';

class AuthNotifier extends StateNotifier {
  AuthNotifier(
    this.ref,
  ) : super(());

  final Ref ref;

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    ref.read(authLoadingProvider.notifier).state = true;
    final response = await http.post(
      Uri.parse('https://campusapi-puce.vercel.app/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final cookies = data['Cookies'] as String;

      await CookieStorage().saveCookie(cookies);
      ref.read(authLoadingProvider.notifier).state = false;
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/navigationMenu');
      }
    } else {
      // Handle error
      if (context.mounted) {
        ref.read(authLoadingProvider.notifier).state = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign in failed')),
        );
      }
    }
  }
}
