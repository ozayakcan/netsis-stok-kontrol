import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../modeller/stok_hareket.dart';
import '../modeller/veritabani_bilgileri.dart';
import '../veritabani/veritabani.dart';
import '../widgetlar/diyalog.dart';
import '../widgetlar/formlar.dart';
import 'sayfa.dart';
import 'stfl_widget.dart';
import 'veritabani_kaydet.dart';

class StokHareketleri extends VarsayilanStatefulWidget {
  const StokHareketleri({
    super.key,
    this.stokKodu = "",
  });

  final String stokKodu;

  @override
  VarsayilanStatefulWidgetState<StokHareketleri> createState() =>
      StokHareketleriState();
}

class StokHareketleriState
    extends VarsayilanStatefulWidgetState<StokHareketleri> {
  bool yenileniyor = false;
  bool diyalogDurumu = false;

  VeritabaniBilgileriModel? veritabaniBilgileriModel;

  List<StokHareketModel> stokHareketleri = [];

  ScrollController stokHareketleriScrollController = ScrollController();

  int yuklenecekOgeIndex = 0;
  int yuklenecekOgeSayisi = 50;

  bool yukleniyor = false;
  bool hepsiYuklendi = false;

  TextEditingController araController = TextEditingController();
  String aramaText = "";
  int aramaMinKarakter = 3;

  @override
  void initState() {
    super.initState();
    init(tumunuYenile: true);
    stokHareketleriScrollController.addListener(() {
      if (stokHareketleriScrollController.position.pixels >=
              stokHareketleriScrollController.position.maxScrollExtent &&
          !yukleniyor &&
          !yenileniyor) {
        init(tumunuYenile: false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    stokHareketleriScrollController.dispose();
    araController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double aramaYukseklik = 50;
    double yukleniyorYukseklik = 35;
    return Sayfa(
      baslik: widget.stokKodu.isEmpty ? "Stok Hareketleri" : widget.stokKodu,
      yenileButonAktif: true,
      yenileButonAction: (!yenileniyor && !yukleniyor)
          ? () async {
              init(tumunuYenile: true);
            }
          : null,
      tumStokHareketleriButonuAktif: widget.stokKodu.isNotEmpty,
      icerik: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              if (!yenileniyor)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: aramaYukseklik,
                    child: TextFieldDef(
                      width: MediaQuery.of(context).size.width,
                      textController: araController,
                      hintText: "Ara",
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
                top: yenileniyor ? 0 : aramaYukseklik,
                left: 0,
                right: 0,
                bottom: yukleniyor ? yukleniyorYukseklik : 0,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: stokHareketleriScrollController,
                        scrollDirection: Axis.vertical,
                        itemCount: stokHareketleri.length,
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
                                            Text(stokHareketleri[index]
                                                .stokKodu),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Wrap(
                                          alignment: WrapAlignment.start,
                                          runAlignment: WrapAlignment.start,
                                          children: [
                                            const Text("TARİH: "),
                                            Text(
                                              Veritabani.mssqlTarih(
                                                tarih: stokHareketleri[index]
                                                    .stharTarih,
                                                saatiGoster: false,
                                              ),
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
        stokHareketleri = [];
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
        List<StokHareketModel> stokHareketleriTemp =
            await Veritabani.stokHareketleriGetir(
          veritabaniBilgileriModel,
          arama: aramaText.isNotEmpty ? aramaText : null,
          baslangic: yuklenecekOgeIndex,
          ogeSayisi: yuklenecekOgeSayisi,
          stokKodu: widget.stokKodu,
        );
        if (stokHareketleriTemp.length < yuklenecekOgeSayisi) {
          setState(() {
            hepsiYuklendi = true;
          });
        }
        if (stokHareketleriTemp.isNotEmpty) {
          setState(() {
            yuklenecekOgeIndex += yuklenecekOgeSayisi;
            stokHareketleri.addAll(stokHareketleriTemp);
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
      aramaText = araController.text;
    });
    init(tumunuYenile: true);
  }
}
