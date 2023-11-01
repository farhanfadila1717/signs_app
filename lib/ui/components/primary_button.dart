import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.color,
    this.foregroundColor,
    this.onTap,
    this.style,
    this.borderRadius,
    this.strokeWidth,
  });

  final String text;
  final Color? color;
  final Color? foregroundColor;
  final VoidCallback? onTap;
  final TextStyle? style;
  final double? borderRadius;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.black12;
          }
          return color;
        }),
        elevation: const MaterialStatePropertyAll(0.0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: foregroundColor ?? Colors.black,
              width: strokeWidth ?? 3,
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: (style ?? TextStyle(color: foregroundColor)),
      ),
    );
  }
}
