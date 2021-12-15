// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final Widget? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.name,
    this.prefixIcon,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = false;

  Widget? _getSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: () {
          setState(() {
            _showPassword = !_showPassword;
          });
        },
        icon: Icon(
          _showPassword ? Icons.visibility : Icons.visibility_off,
          color: _showPassword
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground,
        ),
      );
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: FormBuilderTextField(
        name: widget.name,
        controller: widget.controller,
        style: const TextStyle(letterSpacing: 3),
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: _getSuffixIcon(),
        ),
        obscureText: !_showPassword && widget.isPassword,
      ),
    );
  }
}
