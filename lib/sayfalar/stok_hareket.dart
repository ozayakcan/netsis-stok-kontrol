import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:netsisstok/widgetlar/stok.dart';

import '../modeller/stok.dart';
import '../modeller/stok_hareket.dart';
import '../modeller/veritabani_bilgileri.dart';
import '../veritabani/veritabani.dart';
import '../widgetlar/diyalog.dart';
import '../widgetlar/tablo.dart';
import 'sayfa.dart';
import 'stfl_widget.dart';
import 'veritabani_kaydet.dart';

class StokHareketleri extends VarsayilanStatefulWidget {
  const StokHareketleri({
    super.key,
    this.stokKodu = "",
    this.stokAdi = "",
  });

  final String stokKodu;
  final String stokAdi;

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
  List<StokModel> stoklar = [];

  ScrollController stokHareketleriScrollController = ScrollController();

  int yuklenecekOgeIndex = 0;
  int yuklenecekOgeSayisi = 50;

  bool yukleniyor = false;
  bool hepsiYuklendi = false;

  @override
  void initState() {
    super.initState();
    init(tumunuYenile: true);
    stokHareketleriScrollController.addListener(() {
      if (stokHareketleriScrollController.position.pixels >=
              stokHareketleriScrollController.position.maxScrollExtent &&
          !yukleniyor &&
          !yenileniyor) {
        if (widget.stokKodu.isEmpty) {
          init(tumunuYenile: false);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    stokHareketleriScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double yukleniyorYukseklik = 35;
    double tamBoyut = MediaQuery.of(context).size.width;
    double ogeGenisligi = tamBoyut > 600 ? tamBoyut / 5.5 : tamBoyut / 2.5;
    return Sayfa(
      baslik: widget.stokAdi.isNotEmpty
          ? widget.stokAdi
          : widget.stokKodu.isNotEmpty
              ? widget.stokKodu
              : "Stok Hareketleri",
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
                  bottom: yukleniyor ? yukleniyorYukseklik : 0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Tablo(
                          scrollController: stokHareketleriScrollController,
                          ekIcerik: widget.stokKodu.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Bilgiler",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Tablo(
                                      basliklar: stokBasliklar(
                                        ogeGenisligi: ogeGenisligi,
                                      ),
                                      ogeler: stoklar.map((stok) {
                                        return StokOgeler(
                                          stok: stok,
                                          ogeGenisligi: ogeGenisligi,
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Stok Hareketleri",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                          basliklar: stokHareketleri.isNotEmpty
                              ? [
                                  TabloBaslik(
                                    baslik: "TARİH",
                                    width: ogeGenisligi,
                                  ),
                                  TabloBaslik(
                                    baslik: "FİŞ NO",
                                    width: ogeGenisligi,
                                  ),
                                  TabloBaslik(
                                    baslik: "NET FİYAT",
                                    width: ogeGenisligi,
                                  ),
                                  TabloBaslik(
                                    baslik: "GİRİŞ MİKTARI",
                                    width: ogeGenisligi,
                                  ),
                                  TabloBaslik(
                                    baslik: "ÇIKIŞ MİKTARI",
                                    width: ogeGenisligi,
                                  ),
                                  if (widget.stokKodu.isNotEmpty)
                                    TabloBaslik(
                                      baslik: "BAKİYE",
                                      width: ogeGenisligi,
                                    ),
                                  TabloBaslik(
                                    baslik: "MÜŞTERİ",
                                    width: ogeGenisligi,
                                  ),
                                ]
                              : [
                                  const SizedBox(
                                    height: 50,
                                    child: Text(
                                        "Henüz bir stok hareketi bulunmuyor."),
                                  )
                                ],
                          ogeler: stokHareketleri.map((stokHareketi) {
                            return TabloOge(
                              ogeler: [
                                TabloOgeText(
                                  text: Veritabani.mssqlTarih(
                                    tarih: stokHareketi.vadeTarihi,
                                    saatiGoster: false,
                                  ),
                                  width: ogeGenisligi,
                                ),
                                TabloOgeText(
                                  text: stokHareketi.fisno,
                                  width: ogeGenisligi,
                                ),
                                TabloOgeText(
                                  text: stokHareketi.stharNf.toString(),
                                  width: ogeGenisligi,
                                ),
                                TabloOgeText(
                                  text: stokHareketi.stharGckod ==
                                          StokHareketModel.girisStr
                                      ? stokHareketi.stharGcmik.toString()
                                      : "",
                                  width: ogeGenisligi,
                                ),
                                TabloOgeText(
                                  text: stokHareketi.stharGckod ==
                                          StokHareketModel.cikisStr
                                      ? stokHareketi.stharGcmik.toString()
                                      : "",
                                  width: ogeGenisligi,
                                ),
                                if (widget.stokKodu.isNotEmpty)
                                  TabloOgeText(
                                    text: stokHareketi.bakiye.toString(),
                                    width: ogeGenisligi,
                                  ),
                                TabloOgeText(
                                  text: stokHareketi.stharAciklama,
                                  width: ogeGenisligi,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              if (yenileniyor)
                Positioned(
                  top: 0,
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
    if (tumunuYenile || widget.stokKodu.isNotEmpty) {
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
          baslangic: yuklenecekOgeIndex,
          ogeSayisi: yuklenecekOgeSayisi,
          stokKodu: widget.stokKodu,
        );
        List<StokModel> stoklarTemp = await Veritabani.stoklariGetir(
          veritabaniBilgileriModel,
          arama: widget.stokKodu,
          baslangic: 0,
          ogeSayisi: 1,
        );
        if (stokHareketleriTemp.length < yuklenecekOgeSayisi) {
          setState(() {
            hepsiYuklendi = true;
          });
        }
        if (stokHareketleriTemp.isNotEmpty) {
          if (widget.stokKodu.isEmpty) {
            setState(() {
              yuklenecekOgeIndex += yuklenecekOgeSayisi;
              stokHareketleri.addAll(stokHareketleriTemp);
              stoklar = stoklarTemp;
            });
          } else {
            setState(() {
              yuklenecekOgeIndex = 0;
              stokHareketleri = stokHareketleriTemp;
              stoklar = stoklarTemp;
            });
          }
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

    if (tumunuYenile || widget.stokKodu.isNotEmpty) {
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
}
