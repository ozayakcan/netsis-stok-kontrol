import 'package:flutter/material.dart';

import '../sayfalar/stfl_widget.dart';

class Tablo extends VarsayilanStatefulWidget {
  const Tablo({
    super.key,
    required this.basliklar,
    required this.ogeler,
    this.top,
    this.bottom,
    this.left = 0,
    this.right = 0,
    this.scrollController,
    this.ekIcerik,
    this.ilk = true,
  });

  final ScrollController? scrollController;
  final List<Widget> basliklar;
  final List<Widget> ogeler;
  final Widget? ekIcerik;
  final double? top;
  final double? bottom;
  final double left;
  final double right;
  final bool ilk;
  @override
  VarsayilanStatefulWidgetState<Tablo> createState() => _TabloState();
}

class _TabloState extends VarsayilanStatefulWidgetState<Tablo> {
  @override
  Widget build(BuildContext context) {
    Widget icerik = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.ekIcerik != null) widget.ekIcerik!,
            Row(
              children: widget.basliklar,
            ),
            Column(
              children: widget.ogeler,
            )
          ],
        ),
      ),
    );
    return widget.ilk
        ? Positioned(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: widget.bottom,
            child: Column(
              children: [
                Expanded(
                  child: icerik,
                ),
              ],
            ),
          )
        : icerik;
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
      padding: const EdgeInsets.all(5),
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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
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
