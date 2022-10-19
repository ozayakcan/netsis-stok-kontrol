import 'package:flutter/material.dart';

class Tablo extends StatelessWidget {
  const Tablo({
    super.key,
    required this.basliklar,
    required this.ogeler,
    this.scrollController,
    this.yatayKaydirilabilir = true,
    this.dikeyKaydirilabilir = true,
    this.ekIcerik,
  });

  final ScrollController? scrollController;
  final List<Widget> basliklar;
  final List<Widget> ogeler;
  final bool yatayKaydirilabilir;
  final bool dikeyKaydirilabilir;
  final Widget? ekIcerik;
  @override
  Widget build(BuildContext context) {
    Widget icerik = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ekIcerik != null) ekIcerik!,
        Row(
          children: basliklar,
        ),
        Column(
          children: ogeler,
        )
      ],
    );
    icerik = yatayKaydirilabilir
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: icerik,
          )
        : icerik;
    icerik = dikeyKaydirilabilir
        ? SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: icerik,
          )
        : icerik;
    return icerik;
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
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
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
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Text(text),
        ],
      ),
    );
  }
}
