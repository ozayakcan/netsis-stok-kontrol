import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:netsisstok/model.dart/stok.dart';
import 'package:netsisstok/widgetlar/formlar.dart';

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
  bool yenileniyor = false;
  bool diyalogDurumu = false;

  VeritabaniBilgileriModel? veritabaniBilgileriModel;

  List<StokModel> stoklar = [];

  ScrollController stoklarScrollController = ScrollController();

  int yuklenecekOgeIndex = 0;
  int yuklenecekOgeSayisi = 50;

  bool yukleniyor = false;
  bool hepsiYuklendi = false;

  TextEditingController aramaController = TextEditingController();
  String aramaText = "";
  int aramaMinKarakter = 3;

  @override
  void initState() {
    super.initState();
    init(tumunuYenile: true);
    stoklarScrollController.addListener(() {
      if (stoklarScrollController.position.pixels >=
              stoklarScrollController.position.maxScrollExtent &&
          !yukleniyor &&
          !yenileniyor) {
        init(tumunuYenile: false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    stoklarScrollController.dispose();
    aramaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double aramaYukseklik = 50;
    double yukleniyorYukseklik = 35;
    return Sayfa(
      baslik: "Netsis Stok",
      yenileButonAktif: true,
      yenileButonAction: (!yenileniyor && !yukleniyor)
          ? () async {
              init(tumunuYenile: true);
            }
          : null,
      icerik: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: aramaYukseklik,
                  child: TextFieldDef(
                    width: MediaQuery.of(context).size.width,
                    textController: aramaController,
                    hintText: "Ara",
                    inputFormatters: [
                      BuyukHarfFormatter(),
                    ],
                    suffixIcon: TextFieldIconDef(
                      icon: Icons.search,
                      onPressed: () {
                        ara();
                      },
                    ),
                    onSubmit: () {
                      ara();
                    },
                  ),
                ),
              ),
              Positioned(
                top: aramaYukseklik,
                left: 0,
                right: 0,
                bottom: yukleniyor ? yukleniyorYukseklik : 0,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: stoklarScrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: stoklar.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                if (index == 0)
                                  const Divider(color: Colors.black),
                                InkWell(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Wrap(
                                          alignment: WrapAlignment.start,
                                          runAlignment: WrapAlignment.start,
                                          children: [
                                            const Text("STOK KODU: "),
                                            Text(stoklar[index].stokKodu),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Wrap(
                                          alignment: WrapAlignment.start,
                                          runAlignment: WrapAlignment.start,
                                          children: [
                                            const Text("STOK ADI: "),
                                            Text(
                                              stoklar[index].stokAdi,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.black),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (yenileniyor)
                Positioned(
                  top: aramaYukseklik,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white38,
                    child: Center(
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: Colors.blue,
                        rightDotColor: Colors.red,
                        size: 70,
                      ),
                    ),
                  ),
                ),
              if (yukleniyor)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white38,
                    height: yukleniyorYukseklik,
                    child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void init({
    required bool tumunuYenile,
    bool baglan = false,
  }) async {
    if (tumunuYenile) {
      setState(() {
        stoklar = [];
        yuklenecekOgeIndex = 0;
        yenileniyor = true;
        hepsiYuklendi = false;
      });
    } else {
      if (hepsiYuklendi) {
        return;
      }
      setState(() {
        yukleniyor = true;
      });
    }
    try {
      VeritabaniBilgileriModel? veritabaniBilgileriModelTemp =
          await Veritabani.veritabaniBilgileriGetir();
      if (veritabaniBilgileriModelTemp == null) {
        veritabaniHata(
          baglan: baglan,
          text: "Veritabanı bilgileri alınamadı!",
        );
        return;
      } else {
        setState(() {
          veritabaniBilgileriModel = veritabaniBilgileriModelTemp;
        });
        List<StokModel> stoklarTemp = await Veritabani.stoklariGetir(
          veritabaniBilgileriModel,
          arama: aramaText.isNotEmpty ? aramaText : null,
          baslangic: yuklenecekOgeIndex,
          ogeSayisi: yuklenecekOgeSayisi,
        );
        if (stoklarTemp.length < yuklenecekOgeSayisi) {
          setState(() {
            hepsiYuklendi = true;
          });
        }
        if (stoklarTemp.isNotEmpty) {
          setState(() {
            yuklenecekOgeIndex += yuklenecekOgeSayisi;
            stoklar.addAll(stoklarTemp);
          });
        }
      }
    } catch (e) {
      veritabaniHata(
        baglan: baglan,
        text: "Veritabanına baglanilamadı!",
      );
      if (kDebugMode) {
        print("Veritabanına baglanilamadı! Hata: ${e.toString()}");
      }
    }

    if (tumunuYenile) {
      setState(() {
        yenileniyor = false;
      });
    } else {
      setState(() {
        yukleniyor = false;
      });
    }
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
            init(tumunuYenile: true, baglan: baglan);
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

  void ara() {
    setState(() {
      aramaText = aramaController.text;
    });
    init(tumunuYenile: true);
  }
}
