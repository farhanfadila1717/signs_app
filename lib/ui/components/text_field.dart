import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    this.margin,
  });

  final TextEditingController controller;
  final String title;
  final String hint;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.margin,
  });

  final TextEditingController controller;
  final EdgeInsetsGeometry? margin;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: widget.controller,
            obscureText: _isObsecure,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Masukkan password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObsecure = !_isObsecure;
                  });
                },
                child: Visibility(
                  visible: !_isObsecure,
                  replacement: const Icon(Icons.visibility_off),
                  child: const Icon(Icons.visibility),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
