import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model.dart/veritabani_bilgileri.dart';
import '../veritabani/veritabani.dart';
import '../widgetlar/butonlar.dart';
import '../widgetlar/diyalog.dart';
import '../widgetlar/formlar.dart';
import 'anasayfa.dart';
import 'stfl_widget.dart';

class VeritabaniKaydet extends VarsayilanStatefulWidget {
  const VeritabaniKaydet({super.key});

  static const String yol = "/giris";

  @override
  State<VeritabaniKaydet> createState() => VeritabaniKaydetState();
}

class VeritabaniKaydetState
    extends VarsayilanStatefulWidgetState<VeritabaniKaydet> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController adController = TextEditingController();
  final TextEditingController kullaniciAdiController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();

  final FocusNode ipFocus = FocusNode();
  final FocusNode adFocus = FocusNode();
  final FocusNode kullaniciAdiFocus = FocusNode();
  final FocusNode sifreFocus = FocusNode();

  double gerekliGenislik = 300;

  String girisHatasi = "";

  bool diyalogGosterildi = false;

  @override
  void initState() {
    super.initState();
    Veritabani.veritabaniBilgileriGetir().then((value) {
      if (value != null) {
        ipController.text = value.ip;
        adController.text = value.veritabani;
        kullaniciAdiController.text = value.kullaniciAdi;
        sifreController.text = value.sifre;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tamGenislik = MediaQuery.of(context).size.width;
    final genislik = tamGenislik >= gerekliGenislik
        ? MediaQuery.of(context).size.width - 100
        : MediaQuery.of(context).size.width / 3;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (girisHatasi.isNotEmpty)
                Container(
                  width: genislik,
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.rectangle),
                  child: Center(
                    child: Text(
                      girisHatasi,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              if (girisHatasi.isNotEmpty)
                const SizedBox(
                  height: 7,
                ),
              TextFieldDef(
                width: genislik,
                height: 50,
                textController: ipController,
                currentFocus: ipFocus,
                nextFocus: adFocus,
                onChanged: (value) {
                  setState(() {
                    girisHatasi = "";
                  });
                },
                labelText: "Veritabanı IP Adresi",
              ),
              const SizedBox(
                height: 7,
              ),
              TextFieldDef(
                width: genislik,
                height: 50,
                textController: adController,
                currentFocus: adFocus,
                nextFocus: kullaniciAdiFocus,
                onChanged: (value) {
                  setState(() {
                    girisHatasi = "";
                  });
                },
                labelText: "Veritabanı Adı",
              ),
              const SizedBox(
                height: 7,
              ),
              TextFieldDef(
                width: genislik,
                height: 50,
                textController: kullaniciAdiController,
                currentFocus: kullaniciAdiFocus,
                nextFocus: sifreFocus,
                onChanged: (value) {
                  setState(() {
                    girisHatasi = "";
                  });
                },
                labelText: "Kullanıcı Adı",
              ),
              const SizedBox(
                height: 7,
              ),
              TextFieldDef(
                width: genislik,
                height: 50,
                textController: sifreController,
                currentFocus: sifreFocus,
                onChanged: (value) {
                  setState(() {
                    girisHatasi = "";
                  });
                },
                onSubmit: () async {
                  await bilgileriKaydet();
                },
                labelText: "Şifre",
                isPassword: true,
              ),
              const SizedBox(
                height: 7,
              ),
              ButtonDef(
                width: genislik - 30,
                height: 50,
                fontSize: 17,
                text: "Kaydet",
                onPressed: () async {
                  await bilgileriKaydet();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> bilgileriKaydet() async {
    await Veritabani.veritabaniBilgileriKaydet(
      veritabaniBilgileriModel: VeritabaniBilgileriModel(
        ip: ipController.text,
        veritabani: adController.text,
        kullaniciAdi: kullaniciAdiController.text,
        sifre: sifreController.text,
      ),
      beforeSave: () {
        setState(() {
          girisHatasi = "";
        });
        diyalogGoster(
          context,
          diyalogDurumu: diyalogGosterildi,
          afterDisplayed: () {
            setState(() {
              diyalogGosterildi = true;
            });
          },
        );
      },
      onSaveSuccess: () async {
        await diyalogKapat(
          context,
          diyalogDurumu: diyalogGosterildi,
          afterClosed: () {
            if (kDebugMode) {
              print("Veritabani kaydedildi");
            }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const AnaSayfa(),
              ),
              (route) => false,
            );
          },
        );
      },
      onSaveError: (hata) async {
        diyalogKapat(
          context,
          diyalogDurumu: diyalogGosterildi,
          afterClosed: () {
            setState(() {
              girisHatasi = hata;
            });
          },
        );
      },
    );
  }
}
