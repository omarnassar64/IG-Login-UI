import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.validatorFunc
  });

  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validatorFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
      child: Container(
        color: Colors.white,
        width: 380,
        child: TextFormField(
          validator: validatorFunc,
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey)
          ),
        ),
      ),
    );
  }
}
