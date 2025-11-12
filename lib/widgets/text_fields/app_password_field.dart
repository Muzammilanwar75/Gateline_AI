import 'package:flutter/material.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onTap,
    this.initialValue,
    this.hintTextColor,
    this.inputTextColor,
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
  });

  final bool readOnly;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;
  final Function()? onTap;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Color? hintTextColor;
  final Color? inputTextColor;
  final Color? fillColor;
  final Color? borderColor;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _showPassword = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      obscureText: _showPassword,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        color: widget.inputTextColor ?? Colors.black,
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        fillColor: widget.fillColor?.withOpacity(0.8),
        filled: true,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, size: 20, color: Colors.black)
            : null,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          child: Icon(
            _showPassword ? Icons.visibility_off_outlined : Icons.visibility,
            size: 20,
            color: Colors.black,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintTextColor ?? Colors.grey,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey.shade400,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey.shade400,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
      ),
    );
  }
}
