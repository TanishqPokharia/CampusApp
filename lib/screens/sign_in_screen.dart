import 'package:campus_app/main.dart';
import 'package:campus_app/providers/auth/auth_loading_provider.dart';
import 'package:campus_app/providers/auth/auth_notifier_provider.dart';
import 'package:campus_app/widgets/button.dart';
import 'package:campus_app/widgets/glass_textformfield.dart';
import 'package:campus_app/widgets/sign_in_background.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  final Map<String, String> authDetails = {};
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SignInBackgroundImage(),
        Scaffold(
          backgroundColor: Colors.indigo.shade900.withOpacity(0.1),
          body: Form(
            key: formKey,
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
                    hintText: "Email",
                    onSaved: (value) {
                      authDetails['email'] = value!;
                    },
                    validator: (value) {
                      return;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.responsiveSize(40),
                      vertical: context.responsiveSize(10)),
                  child: GlassTextFormField(
                    hintText: "Password",
                    onSaved: (value) {
                      authDetails['password'] = value!;
                    },
                    validator: (value) {
                      return;
                    },
                  ),
                ),
                SizedBox(
                  height: context.responsiveSize(20),
                ),
                GradientButton(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                      horizontal: context.responsiveSize(40)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final String email = authDetails['email']!;
                      final String password = authDetails['password']!;
                      ref
                          .watch(authNotifierProvider.notifier)
                          .signIn(context, email, password);
                    }
                  },
                  child: ref.watch(authLoadingProvider)
                      ? const CircularProgressIndicator()
                      : Text(
                          "Sign In",
                          style: context.textMedium,
                        ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
