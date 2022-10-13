import 'package:decimal/decimal.dart';

import '../veritabani/degiskenler.dart';

class StokHareketModel {
  StokHareketModel({
    required this.stokKodu,
    required this.fisno,
    required this.stharGcmik,
    required this.stharGcmik2,
    required this.cevrim,
    required this.stharGckod,
    required this.stharTarih,
    required this.stharNf,
    required this.stharBf,
    required this.stharIaf,
    required this.stharKdv,
    required this.depoKodu,
    required this.stharAciklama,
    required this.stharSatisk,
    required this.stharMalfisk,
    required this.stharFtirsip,
    required this.stharSatisk2,
    required this.listeFiat,
    required this.stharHtur,
    required this.stharDovtip,
    required this.promasyonKodu,
    required this.stharDovfiat,
    required this.stharOdegun,
    required this.straSatisk3,
    required this.straSatisk4,
    required this.straSatisk5,
    required this.straSatisk6,
    required this.stharBgtip,
    required this.stharKod1,
    required this.stharKod2,
    required this.stharSipnum,
    required this.stharCarikod,
    required this.stharSipTuru,
    required this.plasiyerKodu,
    required this.ekalanNeden,
    required this.ekalan,
    required this.ekalan1,
    required this.redmik,
    required this.redneden,
    required this.sira,
    required this.straSipkont,
    required this.ambarKabulno,
    required this.firmaDovtip,
    required this.firmaDovtut,
    required this.firmaDovmal,
    required this.updateKodu,
    required this.irsaliyeNo,
    required this.irsaliyeTarih,
    required this.kosulkodu,
    required this.eczaFatTip,
    required this.stharTestar,
    required this.olcubr,
    required this.inckeyno,
    required this.vadeTarihi,
    required this.listeNo,
    required this.baglantiNo,
    required this.subeKodu,
    required this.muhKodu,
    required this.sYedek1,
    required this.sYedek2,
    required this.fYedek3,
    required this.fYedek4,
    required this.fYedek5,
    required this.cYedek6,
    required this.bYedek7,
    required this.iYedek8,
    required this.lYedek9,
    required this.dYedek10,
    required this.projeKodu,
    required this.fiyattarihi,
    required this.kosultarihi,
    required this.satisk1tip,
    required this.satisk2tip,
    required this.satisk3tip,
    required this.satisk4tip,
    required this.satisk5tip,
    required this.satisk6tip,
    required this.exporttype,
    required this.exportmik,
    required this.duzeltmetarihi,
    required this.onaytipi,
    required this.onaynum,
    required this.kkmalf,
    required this.straIrskont,
    required this.yapkod,
    required this.mamyapkod,
    required this.otvfiyat,
  });
  final String stokKodu;
  final String fisno;
  final Decimal stharGcmik;
  final Decimal stharGcmik2;
  final Decimal cevrim;
  final String stharGckod;
  final String stharTarih;
  final Decimal stharNf;
  final Decimal stharBf;
  final Decimal stharIaf;
  final Decimal stharKdv;
  final int depoKodu;
  final String stharAciklama;
  final Decimal stharSatisk;
  final Decimal stharMalfisk;
  final String stharFtirsip;
  final Decimal stharSatisk2;
  final int listeFiat;
  final String stharHtur;
  final int stharDovtip;
  final int promasyonKodu;
  final Decimal stharDovfiat;
  final int stharOdegun;
  final Decimal straSatisk3;
  final Decimal straSatisk4;
  final Decimal straSatisk5;
  final Decimal straSatisk6;
  final String stharBgtip;
  final String stharKod1;
  final String stharKod2;
  final String stharSipnum;
  final String stharCarikod;
  final String stharSipTuru;
  final String plasiyerKodu;
  final String ekalanNeden;
  final String ekalan;
  final String ekalan1;
  final Decimal redmik;
  final int redneden;
  final int sira;
  final int straSipkont;
  final String ambarKabulno;
  final int firmaDovtip;
  final Decimal firmaDovtut;
  final Decimal firmaDovmal;
  final String updateKodu;
  final String irsaliyeNo;
  final String irsaliyeTarih;
  final String kosulkodu;
  final int eczaFatTip;
  final String stharTestar;
  final int olcubr;
  final int inckeyno;
  final String vadeTarihi;
  final String listeNo;
  final int baglantiNo;
  final int subeKodu;
  final String muhKodu;
  final String sYedek1;
  final String sYedek2;
  final Decimal fYedek3;
  final Decimal fYedek4;
  final Decimal fYedek5;
  final String cYedek6;
  final int bYedek7;
  final int iYedek8;
  final int lYedek9;
  final String dYedek10;
  final String projeKodu;
  final String fiyattarihi;
  final String kosultarihi;
  final int satisk1tip;
  final int satisk2tip;
  final int satisk3tip;
  final int satisk4tip;
  final int satisk5tip;
  final int satisk6tip;
  final int exporttype;
  final Decimal exportmik;
  final String duzeltmetarihi;
  final String onaytipi;
  final int onaynum;
  final Decimal kkmalf;
  final int straIrskont;
  final String yapkod;
  final String mamyapkod;
  final Decimal otvfiyat;

  static String stokKoduStr = "STOK_KODU";
  static String fisnoStr = "FISNO";
  static String stharGcmikStr = "STHAR_GCMIK";
  static String stharGcmik2Str = "STHAR_GCMIK2";
  static String cevrimStr = "CEVRIM";
  static String stharGckodStr = "STHAR_GCKOD";
  static String stharTarihStr = "STHAR_TARIH";
  static String stharNfStr = "STHAR_NF";
  static String stharBfStr = "STHAR_BF";
  static String stharIafStr = "STHAR_IAF";
  static String stharKdvStr = "STHAR_KDV";
  static String depoKoduStr = "DEPO_KODU";
  static String stharAciklamaStr = "STHAR_ACIKLAMA";
  static String stharSatiskStr = "STHAR_SATISK";
  static String stharMalfiskStr = "STHAR_MALFISK";
  static String stharFtirsipStr = "STHAR_FTIRSIP";
  static String stharSatisk2Str = "STHAR_SATISK2";
  static String listeFiatStr = "LISTE_FIAT";
  static String stharHturStr = "STHAR_HTUR";
  static String stharDovtipStr = "STHAR_DOVTIP";
  static String promasyonKoduStr = "PROMASYON_KODU";
  static String stharDovfiatStr = "STHAR_DOVFIAT";
  static String stharOdegunStr = "STHAR_ODEGUN";
  static String straSatisk3Str = "STRA_SATISK3";
  static String straSatisk4Str = "STRA_SATISK4";
  static String straSatisk5Str = "STRA_SATISK5";
  static String straSatisk6Str = "STRA_SATISK6";
  static String stharBgtipStr = "STHAR_BGTIP";
  static String stharKod1Str = "STHAR_KOD1";
  static String stharKod2Str = "STHAR_KOD2";
  static String stharSipnumStr = "STHAR_SIPNUM";
  static String stharCarikodStr = "STHAR_CARIKOD";
  static String stharSipTuruStr = "STHAR_SIP_TURU";
  static String plasiyerKoduStr = "PLASIYER_KODU";
  static String ekalanNedenStr = "EKALAN_NEDEN";
  static String ekalanStr = "EKALAN";
  static String ekalan1Str = "EKALAN1";
  static String redmikStr = "REDMIK";
  static String rednedenStr = "REDNEDEN";
  static String siraStr = "SIRA";
  static String straSipkontStr = "STRA_SIPKONT";
  static String ambarKabulnoStr = "AMBAR_KABULNO";
  static String firmaDovtipStr = "FIRMA_DOVTIP";
  static String firmaDovtutStr = "FIRMA_DOVTUT";
  static String firmaDovmalStr = "FIRMA_DOVMAL";
  static String updateKoduStr = "UPDATE_KODU";
  static String irsaliyeNoStr = "IRSALIYE_NO";
  static String irsaliyeTarihStr = "IRSALIYE_TARIH";
  static String kosulkoduStr = "KOSULKODU";
  static String eczaFatTipStr = "ECZA_FAT_TIP";
  static String stharTestarStr = "STHAR_TESTAR";
  static String olcubrStr = "OLCUBR";
  static String inckeynoStr = "INCKEYNO";
  static String vadeTarihiStr = "VADE_TARIHI";
  static String listeNoStr = "LISTE_NO";
  static String baglantiNoStr = "BAGLANTI_NO";
  static String subeKoduStr = "SUBE_KODU";
  static String muhKoduStr = "MUH_KODU";
  static String sYedek1Str = "S_YEDEK1";
  static String sYedek2Str = "S_YEDEK2";
  static String fYedek3Str = "F_YEDEK3";
  static String fYedek4Str = "F_YEDEK4";
  static String fYedek5Str = "F_YEDEK5";
  static String cYedek6Str = "C_YEDEK6";
  static String bYedek7Str = "B_YEDEK7";
  static String iYedek8Str = "I_YEDEK8";
  static String lYedek9Str = "L_YEDEK9";
  static String dYedek10Str = "D_YEDEK10";
  static String projeKoduStr = "PROJE_KODU";
  static String fiyattarihiStr = "FIYATTARIHI";
  static String kosultarihiStr = "KOSULTARIHI";
  static String satisk1tipStr = "SATISK1TIP";
  static String satisk2tipStr = "SATISK2TIP";
  static String satisk3tipStr = "SATISK3TIP";
  static String satisk4tipStr = "SATISK4TIP";
  static String satisk5tipStr = "SATISK5TIP";
  static String satisk6tipStr = "SATISK6TIP";
  static String exporttypeStr = "EXPORTTYPE";
  static String exportmikStr = "EXPORTMIK";
  static String duzeltmetarihiStr = "DUZELTMETARIHI";
  static String onaytipiStr = "ONAYTIPI";
  static String onaynumStr = "ONAYNUM";
  static String kkmalfStr = "KKMALF";
  static String straIrskontStr = "STRA_IRSKONT";
  static String yapkodStr = "YAPKOD";
  static String mamyapkodStr = "MAMYAPKOD";
  static String otvfiyatStr = "OTVFIYAT";
  factory StokHareketModel.fromJson(Map<String, dynamic> jsonData) {
    return StokHareketModel(
      stokKodu: Degiskenler.parseString(degisken: jsonData[stokKoduStr]),
      fisno: Degiskenler.parseString(degisken: jsonData[fisnoStr]),
      stharGcmik: Degiskenler.parseDecimal(degisken: jsonData[stharGcmikStr]),
      stharGcmik2: Degiskenler.parseDecimal(degisken: jsonData[stharGcmik2Str]),
      cevrim: Degiskenler.parseDecimal(degisken: jsonData[cevrimStr]),
      stharGckod: Degiskenler.parseString(degisken: jsonData[stharGckodStr]),
      stharTarih: Degiskenler.parseString(degisken: jsonData[stharTarihStr]),
      stharNf: Degiskenler.parseDecimal(degisken: jsonData[stharNfStr]),
      stharBf: Degiskenler.parseDecimal(degisken: jsonData[stharBfStr]),
      stharIaf: Degiskenler.parseDecimal(degisken: jsonData[stharIafStr]),
      stharKdv: Degiskenler.parseDecimal(degisken: jsonData[stharKdvStr]),
      depoKodu: Degiskenler.parseInt(degisken: jsonData[depoKoduStr]),
      stharAciklama:
          Degiskenler.parseString(degisken: jsonData[stharAciklamaStr]),
      stharSatisk: Degiskenler.parseDecimal(degisken: jsonData[stharSatiskStr]),
      stharMalfisk:
          Degiskenler.parseDecimal(degisken: jsonData[stharMalfiskStr]),
      stharFtirsip:
          Degiskenler.parseString(degisken: jsonData[stharFtirsipStr]),
      stharSatisk2:
          Degiskenler.parseDecimal(degisken: jsonData[stharSatisk2Str]),
      listeFiat: Degiskenler.parseInt(degisken: jsonData[listeFiatStr]),
      stharHtur: Degiskenler.parseString(degisken: jsonData[stharHturStr]),
      stharDovtip: Degiskenler.parseInt(degisken: jsonData[stharDovtipStr]),
      promasyonKodu: Degiskenler.parseInt(degisken: jsonData[promasyonKoduStr]),
      stharDovfiat:
          Degiskenler.parseDecimal(degisken: jsonData[stharDovfiatStr]),
      stharOdegun: Degiskenler.parseInt(degisken: jsonData[stharOdegunStr]),
      straSatisk3: Degiskenler.parseDecimal(degisken: jsonData[straSatisk3Str]),
      straSatisk4: Degiskenler.parseDecimal(degisken: jsonData[straSatisk4Str]),
      straSatisk5: Degiskenler.parseDecimal(degisken: jsonData[straSatisk5Str]),
      straSatisk6: Degiskenler.parseDecimal(degisken: jsonData[straSatisk6Str]),
      stharBgtip: Degiskenler.parseString(degisken: jsonData[stharBgtipStr]),
      stharKod1: Degiskenler.parseString(degisken: jsonData[stharKod1Str]),
      stharKod2: Degiskenler.parseString(degisken: jsonData[stharKod2Str]),
      stharSipnum: Degiskenler.parseString(degisken: jsonData[stharSipnumStr]),
      stharCarikod:
          Degiskenler.parseString(degisken: jsonData[stharCarikodStr]),
      stharSipTuru:
          Degiskenler.parseString(degisken: jsonData[stharSipTuruStr]),
      plasiyerKodu:
          Degiskenler.parseString(degisken: jsonData[plasiyerKoduStr]),
      ekalanNeden: Degiskenler.parseString(degisken: jsonData[ekalanNedenStr]),
      ekalan: Degiskenler.parseString(degisken: jsonData[ekalanStr]),
      ekalan1: Degiskenler.parseString(degisken: jsonData[ekalan1Str]),
      redmik: Degiskenler.parseDecimal(degisken: jsonData[redmikStr]),
      redneden: Degiskenler.parseInt(degisken: jsonData[rednedenStr]),
      sira: Degiskenler.parseInt(degisken: jsonData[siraStr]),
      straSipkont: Degiskenler.parseInt(degisken: jsonData[straSipkontStr]),
      ambarKabulno:
          Degiskenler.parseString(degisken: jsonData[ambarKabulnoStr]),
      firmaDovtip: Degiskenler.parseInt(degisken: jsonData[firmaDovtipStr]),
      firmaDovtut: Degiskenler.parseDecimal(degisken: jsonData[firmaDovtutStr]),
      firmaDovmal: Degiskenler.parseDecimal(degisken: jsonData[firmaDovmalStr]),
      updateKodu: Degiskenler.parseString(degisken: jsonData[updateKoduStr]),
      irsaliyeNo: Degiskenler.parseString(degisken: jsonData[irsaliyeNoStr]),
      irsaliyeTarih:
          Degiskenler.parseString(degisken: jsonData[irsaliyeTarihStr]),
      kosulkodu: Degiskenler.parseString(degisken: jsonData[kosulkoduStr]),
      eczaFatTip: Degiskenler.parseInt(degisken: jsonData[eczaFatTipStr]),
      stharTestar: Degiskenler.parseString(degisken: jsonData[stharTestarStr]),
      olcubr: Degiskenler.parseInt(degisken: jsonData[olcubrStr]),
      inckeyno: Degiskenler.parseInt(degisken: jsonData[inckeynoStr]),
      vadeTarihi: Degiskenler.parseString(degisken: jsonData[vadeTarihiStr]),
      listeNo: Degiskenler.parseString(degisken: jsonData[listeNoStr]),
      baglantiNo: Degiskenler.parseInt(degisken: jsonData[baglantiNoStr]),
      subeKodu: Degiskenler.parseInt(degisken: jsonData[subeKoduStr]),
      muhKodu: Degiskenler.parseString(degisken: jsonData[muhKoduStr]),
      sYedek1: Degiskenler.parseString(degisken: jsonData[sYedek1Str]),
      sYedek2: Degiskenler.parseString(degisken: jsonData[sYedek2Str]),
      fYedek3: Degiskenler.parseDecimal(degisken: jsonData[fYedek3Str]),
      fYedek4: Degiskenler.parseDecimal(degisken: jsonData[fYedek4Str]),
      fYedek5: Degiskenler.parseDecimal(degisken: jsonData[fYedek5Str]),
      cYedek6: Degiskenler.parseString(degisken: jsonData[cYedek6Str]),
      bYedek7: Degiskenler.parseInt(degisken: jsonData[bYedek7Str]),
      iYedek8: Degiskenler.parseInt(degisken: jsonData[iYedek8Str]),
      lYedek9: Degiskenler.parseInt(degisken: jsonData[lYedek9Str]),
      dYedek10: Degiskenler.parseString(degisken: jsonData[dYedek10Str]),
      projeKodu: Degiskenler.parseString(degisken: jsonData[projeKoduStr]),
      fiyattarihi: Degiskenler.parseString(degisken: jsonData[fiyattarihiStr]),
      kosultarihi: Degiskenler.parseString(degisken: jsonData[kosultarihiStr]),
      satisk1tip: Degiskenler.parseInt(degisken: jsonData[satisk1tipStr]),
      satisk2tip: Degiskenler.parseInt(degisken: jsonData[satisk2tipStr]),
      satisk3tip: Degiskenler.parseInt(degisken: jsonData[satisk3tipStr]),
      satisk4tip: Degiskenler.parseInt(degisken: jsonData[satisk4tipStr]),
      satisk5tip: Degiskenler.parseInt(degisken: jsonData[satisk5tipStr]),
      satisk6tip: Degiskenler.parseInt(degisken: jsonData[satisk6tipStr]),
      exporttype: Degiskenler.parseInt(degisken: jsonData[exporttypeStr]),
      exportmik: Degiskenler.parseDecimal(degisken: jsonData[exportmikStr]),
      duzeltmetarihi:
          Degiskenler.parseString(degisken: jsonData[duzeltmetarihiStr]),
      onaytipi: Degiskenler.parseString(degisken: jsonData[onaytipiStr]),
      onaynum: Degiskenler.parseInt(degisken: jsonData[onaynumStr]),
      kkmalf: Degiskenler.parseDecimal(degisken: jsonData[kkmalfStr]),
      straIrskont: Degiskenler.parseInt(degisken: jsonData[straIrskontStr]),
      yapkod: Degiskenler.parseString(degisken: jsonData[yapkodStr]),
      mamyapkod: Degiskenler.parseString(degisken: jsonData[mamyapkodStr]),
      otvfiyat: Degiskenler.parseDecimal(degisken: jsonData[otvfiyatStr]),
    );
  }
  String stharTarihiDuzen({
    bool saatiGoster = true,
  }) {
    // Veritabanı örnek tarih 2015-05-28 10:04:30.000
    if (stharTarih.length >= 16) {
      String yil = stharTarih.substring(0, 4);
      String ay = stharTarih.substring(5, 7);
      String gun = stharTarih.substring(8, 10);
      String saat = stharTarih.substring(11, 13);
      String dakika = stharTarih.substring(14, 16);
      return "$gun.$ay.$yil${saatiGoster ? " $saat:$dakika" : ""}";
    } else {
      return stharTarih;
    }
  }
}
