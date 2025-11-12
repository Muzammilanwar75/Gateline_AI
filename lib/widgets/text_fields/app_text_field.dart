import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.readOnly = false,
    this.isPassword = false,
    this.validator,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onTap,
    this.minLines = 1,
    this.maxLines = 1,
    this.hintTextColor,
    this.inputTextColor,
    this.fillColor = Colors.white,
    this.borderColor,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.enabled = true,
    this.showClearButton = false,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.borderRadius = 12,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool readOnly;
  final bool isPassword;
  final int minLines;
  final double? borderRadius;
  final int maxLines;
  final FormFieldValidator<String?>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final Color? hintTextColor;
  final Color? inputTextColor;
  final Color? fillColor;
  final Color? borderColor;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool showClearButton;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter<String>? onSaved;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late final TextEditingController _controller;
  late final bool _controllerIsExternal;
  late final FocusNode _focusNode;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controllerIsExternal = widget.controller != null;
    _controller =
        widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.isPassword;
    _controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    // Rebuild to show/hide clear button
    if (widget.showClearButton) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    if (!_controllerIsExternal) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget? suffixWidget = widget.suffix;
    if (widget.isPassword) {
      suffixWidget = IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          size: 20,
        ),
        onPressed: _toggleObscure,
        splashRadius: 20,
      );
    } else if (widget.showClearButton) {
      final hasText = _controller.text.isNotEmpty;
      suffixWidget = hasText
          ? IconButton(
              icon: const Icon(Icons.clear, size: 20),
              onPressed: () {
                _controller.clear();
                widget.onChanged?.call('');
              },
              splashRadius: 20,
            )
          : null;
    } else if (widget.suffixIcon != null) {
      suffixWidget = Icon(widget.suffixIcon, size: 20);
    }

    final prefixWidget =
        widget.prefix ??
        (widget.prefixIcon != null ? Icon(widget.prefixIcon, size: 20) : null);

    return TextFormField(
      controller: _controllerIsExternal ? widget.controller : _controller,
      focusNode: _focusNode,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
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
        fillColor: widget.fillColor,
        filled: true,
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
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
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          borderSide: BorderSide(
            color: widget.borderColor ?? Colors.grey.shade400,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.borderColor ?? theme.colorScheme.primary,
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
      autofocus: widget.autofocus,
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      onSaved: widget.onSaved,
    );
  }
}
