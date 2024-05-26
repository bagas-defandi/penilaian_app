import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPasswordHidden;
  final VoidCallback? onPressedPassword;
  final bool isOnlyNumber;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const PrimaryTextField({
    super.key,
    required this.name,
    required this.controller,
    this.isPassword = false,
    this.isPasswordHidden = false,
    this.onPressedPassword,
    this.hintText = '',
    this.isOnlyNumber = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator ??
          (value) =>
              value == null || value.isEmpty ? '$name wajib diisi' : null,
      decoration: InputDecoration(
        hintText: hintText.isNotEmpty ? hintText : name,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onPressedPassword,
                icon: Icon(
                    isPasswordHidden ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
      obscureText: isPasswordHidden ? true : false,
      style: const TextStyle(color: Colors.black),
      keyboardType:
          isOnlyNumber ? const TextInputType.numberWithOptions() : null,
      inputFormatters:
          isOnlyNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
    );
  }
}
