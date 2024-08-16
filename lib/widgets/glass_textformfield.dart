import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class GlassTextFormField extends StatelessWidget {
  const GlassTextFormField(
      {super.key,
      required this.hintText,
      required this.onSaved,
      required this.validator});

  final String hintText;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize(30),
            vertical: context.responsiveSize(20)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      enableSuggestions: true,
    ).asGlass(
        frosted: false,
        tintColor: Colors.blue,
        clipBorderRadius: BorderRadius.circular(context.responsiveSize(20)));
  }
}
