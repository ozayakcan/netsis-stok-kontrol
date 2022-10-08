import 'package:flutter/material.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
    required this.home,
  });
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Netsis Stok",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF343A40, {
          50: Color.fromRGBO(52, 58, 64, .1),
          100: Color.fromRGBO(52, 58, 64, .2),
          200: Color.fromRGBO(52, 58, 64, .3),
          300: Color.fromRGBO(52, 58, 64, .4),
          400: Color.fromRGBO(52, 58, 64, .5),
          500: Color.fromRGBO(52, 58, 64, .6),
          600: Color.fromRGBO(52, 58, 64, .7),
          700: Color.fromRGBO(52, 58, 64, .8),
          800: Color.fromRGBO(52, 58, 64, .9),
          900: Color.fromRGBO(52, 58, 64, 1),
        }),
        scaffoldBackgroundColor: Colors.white,
        disabledColor: Colors.white54,
      ),
      home: home,
    );
  }
}
