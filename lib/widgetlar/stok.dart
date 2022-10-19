import 'package:flutter/material.dart';

import '../modeller/stok.dart';
import '../veritabani/degiskenler.dart';
import '../veritabani/veritabani.dart';
import 'tablo.dart';

List<Widget> stokBasliklar({
  double? ogeGenisligi,
}) {
  return [
    TabloBaslik(
      baslik: "STOK KODU",
      width: ogeGenisligi,
    ),
    TabloBaslik(
      baslik: "STOK ADI",
      width: ogeGenisligi,
    ),
    TabloBaslik(
      baslik: "ALIŞ FİYATLARI",
      width: ogeGenisligi,
    ),
    TabloBaslik(
      baslik: "SATIŞ FİYATLARI",
      width: ogeGenisligi,
    ),
    TabloBaslik(
      baslik: "KDV (%)",
      width: ogeGenisligi,
    ),
    TabloBaslik(
      baslik: "ÖLÇÜ BİRİMİ",
      width: ogeGenisligi,
    ),
    TabloBaslik(
      baslik: "KAYIT TARİHİ",
      width: ogeGenisligi,
    ),
  ];
}

class StokOgeler extends StatelessWidget {
  const StokOgeler({
    super.key,
    required this.stok,
    this.ogeGenisligi,
    this.onPressed,
  });

  final StokModel stok;
  final double? ogeGenisligi;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    bool alisFiyati1 = stok.alisFiat1 > Degiskenler.parseDecimal(degisken: "0");
    bool alisFiyati2 = stok.alisFiat2 > Degiskenler.parseDecimal(degisken: "0");
    bool alisFiyati3 = stok.alisFiat3 > Degiskenler.parseDecimal(degisken: "0");
    bool alisFiyati4 = stok.alisFiat4 > Degiskenler.parseDecimal(degisken: "0");
    bool satisFiyati1 =
        stok.satisFiat1 > Degiskenler.parseDecimal(degisken: "0");
    bool satisFiyati2 =
        stok.satisFiat2 > Degiskenler.parseDecimal(degisken: "0");
    bool satisFiyati3 =
        stok.satisFiat3 > Degiskenler.parseDecimal(degisken: "0");
    bool satisFiyati4 =
        stok.satisFiat4 > Degiskenler.parseDecimal(degisken: "0");
    return TabloOge(
      onPressed: onPressed,
      ogeler: [
        TabloOgeText(
          text: stok.stokKodu,
          width: ogeGenisligi,
        ),
        TabloOgeText(
          text: stok.stokAdi,
          width: ogeGenisligi,
        ),
        TabloOgeText(
          text:
              "${alisFiyati1 ? stok.alisFiat1 : ""}${alisFiyati2 ? "\n${stok.alisFiat2}" : ""}${alisFiyati3 ? "\n${stok.alisFiat3}" : ""}${alisFiyati4 ? "\n${stok.alisFiat4}" : ""}",
          width: ogeGenisligi,
        ),
        TabloOgeText(
          text:
              "${satisFiyati1 ? stok.satisFiat1 : ""}${satisFiyati2 ? "\n${stok.satisFiat2}" : ""}${satisFiyati3 ? "\n${stok.satisFiat3}" : ""}${satisFiyati4 ? "\n${stok.satisFiat4}" : ""}",
          width: ogeGenisligi,
        ),
        TabloOgeText(
          text: stok.kdvOrani.toString(),
          width: ogeGenisligi,
        ),
        TabloOgeText(
          text:
              "${stok.olcuBr1.isNotEmpty ? "1: ${stok.olcuBr1}" : ""}${stok.olcuBr2.isNotEmpty ? "\n2: ${stok.olcuBr2}" : ""}${stok.olcuBr3.isNotEmpty ? "\n3: ${stok.olcuBr3}" : ""}",
          width: ogeGenisligi,
        ),
        TabloOgeText(
          text: Veritabani.mssqlTarih(
            tarih: stok.kayittarihi,
            saatiGoster: false,
          ),
          width: ogeGenisligi,
        ),
      ],
    );
  }
}
