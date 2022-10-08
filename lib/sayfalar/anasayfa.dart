import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sql_conn/sql_conn.dart';

import '../model.dart/veritabani_bilgileri.dart';
import '../veritabani/veritabani.dart';
import '../widgetlar/diyalog.dart';
import 'sayfa.dart';
import 'stfl_widget.dart';
import 'veritabani_kaydet.dart';

class AnaSayfa extends VarsayilanStatefulWidget {
  const AnaSayfa({
    super.key,
  });

  @override
  VarsayilanStatefulWidgetState<AnaSayfa> createState() => AnaSayfaState();
}

class AnaSayfaState extends VarsayilanStatefulWidgetState<AnaSayfa> {
  bool yukleniyor = false;
  bool diyalogDurumu = false;

  @override
  void initState() {
    super.initState();
    init(baglan: !SqlConn.isConnected);
  }

  @override
  Widget build(BuildContext context) {
    return const Sayfa(
      baslik: "Netsis Stok",
      icerik: Center(
        child: Text("Anasayfa"),
      ),
    );
  }

  void init({
    bool baglan = false,
  }) async {
    setState(() {
      yukleniyor = true;
    });
    if (baglan) {
      VeritabaniBilgileriModel? veritabaniBilgileriModel =
          await Veritabani.veritabaniBilgileriGetir();
      if (veritabaniBilgileriModel == null) {
        veritabaniHata(
          baglan: baglan,
          text: "Veritabanı bilgileri alınamadı!",
        );
      } else {
        bool durum = await Veritabani.baglan(
            veritabaniBilgileriModel: veritabaniBilgileriModel);
        if (!durum) {
          veritabaniHata(
            baglan: baglan,
            text: "Veritabanına bağlanılamadı!",
          );
        } else {
          if (kDebugMode) {
            print("Veritabanına bağlandı");
          }
          await bilgileriGetir();
        }
      }
    } else {
      await bilgileriGetir();
    }
    setState(() {
      yukleniyor = false;
    });
  }

  Future<void> bilgileriGetir() async {
    // TODO Stokları çekme eklenecek.
  }

  void veritabaniHata({
    required bool baglan,
    required String text,
  }) {
    diyalogGoster(
      context,
      diyalogDurumu: diyalogDurumu,
      afterDisplayed: () {
        setState(() {
          diyalogDurumu = true;
        });
      },
      text: text,
      actions: [
        TextButton(
          onPressed: () {
            diyalogKapat(
              context,
              diyalogDurumu: diyalogDurumu,
              afterClosed: () {
                setState(() {
                  diyalogDurumu = false;
                });
              },
            );
            init(baglan: baglan);
          },
          child: const Text("Tekrar Dene"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const VeritabaniKaydet(),
              ),
            );
          },
          child: const Text("Bilgileri Düzenle"),
        ),
      ],
    );
  }
}
