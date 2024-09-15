import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({
    super.key,
    this.hintText,
    this.onChange,
    this.obscureText = false,
     this.prefixIcon,
     this.suffixIcon,
  });
  String? hintText;
  Function(String)? onChange;
  bool? obscureText;
  Icon? prefixIcon;
  Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
