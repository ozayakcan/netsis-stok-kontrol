import 'package:flutter/material.dart';

void diyalogGoster(
  BuildContext context, {
  required bool diyalogDurumu,
  required VoidCallback afterDisplayed,
  String? text,
}) {
  if (!diyalogDurumu) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 5,
              ),
              Text(
                text ?? "Kaydediliyor...",
              ),
            ],
          ),
        );
      },
    );
    afterDisplayed.call();
  }
}

Future<void> diyalogKapat(
  BuildContext context, {
  required bool diyalogDurumu,
  required VoidCallback afterClosed,
}) async {
  await Future.delayed(const Duration(seconds: 2), () {
    if (diyalogDurumu) {
      Navigator.pop(context);
    }
    afterClosed.call();
  });
}
