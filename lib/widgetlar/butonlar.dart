import 'package:flutter/material.dart';

class ButtonDef extends StatelessWidget {
  const ButtonDef({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.fontSize,
    this.onPressed,
  });

  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        alignment: Alignment.center,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
