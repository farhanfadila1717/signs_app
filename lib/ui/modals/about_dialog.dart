import 'package:signs_app/ui/components/primary_button.dart';
import 'package:flutter/material.dart';

class AboutDialog extends StatelessWidget {
  const AboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tentang',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Pembuat: Noval Akbar Ramadhan',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Pembimbing Materi: Bertha Meyke W. Hutajulu, S.Kom., M.M.S.I',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Pembimbing Teknik: Mei Lestari, M.Kom',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: PrimaryButton(
                text: 'Oke',
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
