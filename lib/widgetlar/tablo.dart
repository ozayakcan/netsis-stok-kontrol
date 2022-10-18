import 'package:flutter/material.dart';

class Tablo extends StatelessWidget {
  const Tablo({
    super.key,
    required this.basliklar,
    required this.ogeler,
    this.scrollController,
  });

  final ScrollController? scrollController;
  final List<Widget> basliklar;
  final List<Widget> ogeler;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: basliklar,
            ),
            Column(
              children: ogeler,
            )
          ],
        ),
      ),
    );
  }
}

class TabloBaslik extends StatelessWidget {
  const TabloBaslik({
    super.key,
    required this.baslik,
    this.width,
  });

  final double? width;
  final String baslik;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            baslik,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class TabloOge extends StatelessWidget {
  const TabloOge({
    super.key,
    required this.ogeler,
    this.onPressed,
  });

  final List<Widget> ogeler;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Divider(color: Colors.black),
          InkWell(
            onTap: onPressed,
            child: Row(
              children: ogeler,
            ),
          ),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}

class TabloOgeText extends StatelessWidget {
  const TabloOgeText({
    super.key,
    required this.text,
    this.width,
  });

  final double? width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(text),
        ],
      ),
    );
  }
}
