import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.color,
    this.onTap,
    this.style,
  });

  final String text;
  final Color? color;
  final VoidCallback? onTap;
  final TextStyle? style;

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
        shape: const MaterialStatePropertyAll(
          StadiumBorder(),
        ),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
