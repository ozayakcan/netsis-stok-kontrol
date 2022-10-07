import 'package:flutter/material.dart';

import 'sayfalar/anasayfa.dart';
import 'sayfalar/material_app.dart';
import 'sayfalar/veritabani_kaydet.dart';
import 'veritabani/veritabani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Veritabani.veritabaniBaglantiDurumu(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return MaterialAppWidget(
            home: Container(),
          );
        } else {
          if (snapshot.data == true) {
            return const MaterialAppWidget(home: AnaSayfa());
          } else {
            return const MaterialAppWidget(home: VeritabaniKaydet());
          }
        }
      },
    );
  }
}
