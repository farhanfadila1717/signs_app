import 'package:flutter/material.dart';
import 'package:signs_app/ui/components/primary_button.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
    required this.onCancel,
  });

  final String title;
  final String message;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 20,
            top: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onCancel?.call();
              },
              child: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: PrimaryButton(
                    text: 'Oke',
                    onTap: () {
                      Navigator.pop(context);
                      onTap?.call();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
