import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkish/turkish.dart';

import '../sayfalar/stfl_widget.dart';

typedef OnChanged = void Function(
  String value,
);

class TextFieldDef extends VarsayilanStatefulWidget {
  const TextFieldDef({
    super.key,
    required this.width,
    required this.textController,
    this.height,
    this.backgroundEnabled = false,
    this.labelText,
    this.hintText,
    this.inputType,
    this.inputFormatters,
    this.isPassword = false,
    this.maxLength,
    this.maxHeight,
    this.minHeight,
    this.onSubmit,
    this.onChanged,
    this.currentFocus,
    this.nextFocus,
    this.autoFocus = false,
    this.autofillHints,
    this.isMultiline = false,
    this.rounded = false,
    this.suffixIcon,
  });

  final bool backgroundEnabled;
  final double width;
  final TextEditingController textController;
  final double? height;
  final String? labelText;
  final String? hintText;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final int? maxLength;
  final double? maxHeight;
  final double? minHeight;
  final VoidCallback? onSubmit;
  final OnChanged? onChanged;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final bool autoFocus;
  final Iterable<String>? autofillHints;
  final bool isMultiline;
  final bool rounded;
  final Widget? suffixIcon;

  @override
  State<TextFieldDef> createState() => _TextFieldDefState();
}

class _TextFieldDefState extends VarsayilanStatefulWidgetState<TextFieldDef> {
  bool passwordVisible = false;
  ScrollController scrollController = ScrollController();

  void disposeControllers() {
    scrollController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget textfield = TextField(
      controller: widget.textController,
      focusNode: widget.currentFocus,
      autofocus: widget.autoFocus,
      obscureText: widget.isPassword ? !passwordVisible : false,
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      autofillHints: widget.autofillHints,
      maxLines: widget.isMultiline ? null : 1,
      keyboardType: widget.inputType ??
          (widget.isMultiline ? TextInputType.multiline : TextInputType.text),
      maxLength: widget.maxLength,
      textInputAction: widget.nextFocus != null
          ? TextInputAction.next
          : widget.isMultiline
              ? null
              : TextInputAction.done,
      inputFormatters: widget.inputFormatters,
      textAlignVertical:
          widget.rounded ? TextAlignVertical.center : TextAlignVertical.bottom,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelText != null
            ? const TextStyle(
                color: Colors.black,
              )
            : null,
        contentPadding: const EdgeInsets.only(bottom: 10),
        hintStyle: const TextStyle(
          color: Colors.black54,
        ),
        hintText: widget.hintText,
        enabledBorder: !widget.rounded ? underlineInputBorder() : null,
        focusedBorder: !widget.rounded ? underlineInputBorder() : null,
        suffixIcon: widget.isPassword
            ? TextFieldIconDef(
                icon: passwordVisible ? Icons.visibility : Icons.visibility_off,
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
            : widget.suffixIcon,
      ),
      onSubmitted: widget.onSubmit == null && widget.nextFocus == null
          ? null
          : (v) {
              if (widget.onSubmit != null) {
                widget.onSubmit?.call();
                return;
              }
              if (widget.nextFocus != null) {
                widget.nextFocus?.requestFocus();
                return;
              }
            },
      onChanged: (value) {
        widget.onChanged?.call(value);
      },
    );
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight ?? double.infinity,
        minHeight: widget.minHeight ?? 0.0,
      ),
      decoration: widget.backgroundEnabled
          ? BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                25,
              ),
              border: Border.all(
                color: Colors.black87,
                width: 0.0,
              ),
            )
          : null,
      child: widget.isMultiline
          ? SingleChildScrollView(
              controller: scrollController,
              child: (textfield),
            )
          : textfield,
    );
  }
}

InputBorder underlineInputBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,
      width: 0.0,
    ),
  );
}

class TextFieldIconDef extends StatelessWidget {
  const TextFieldIconDef({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.black,
      onPressed: onPressed,
    );
  }
}

class BuyukHarfFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCaseTr(),
      selection: newValue.selection,
    );
  }
}
