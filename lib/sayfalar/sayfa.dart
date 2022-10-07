import 'package:flutter/material.dart';

class Sayfa extends StatelessWidget {
  const Sayfa({
    super.key,
    this.appBarGoster = true,
    this.baslik = "",
    required this.icerik,
  });
  final bool appBarGoster;
  final String baslik;
  final Widget icerik;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarGoster
          ? AppBar(
              title: Text(baslik),
            )
          : null,
      body: icerik,
    );
  }
}
