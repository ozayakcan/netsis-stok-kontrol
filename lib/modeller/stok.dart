import 'package:decimal/decimal.dart';

import '../veritabani/degiskenler.dart';

class StokModel {
  StokModel({
    required this.subeKodu,
    required this.isletmeKodu,
    required this.stokKodu,
    required this.ureticiKodu,
    required this.stokAdi,
    required this.grupKodu,
    required this.kod1,
    required this.kod2,
    required this.kod3,
    required this.kod4,
    required this.kod5,
    required this.saticiKodu,
    required this.olcuBr1,
    required this.olcuBr2,
    required this.pay1,
    required this.payda1,
    required this.olcuBr3,
    required this.pay2,
    required this.payda2,
    required this.fiatBirimi,
    required this.azamiStok,
    required this.asgariStok,
    required this.teminSuresi,
    required this.kulMik,
    required this.riskSuresi,
    required this.zamanBirimi,
    required this.satisFiat1,
    required this.satisFiat2,
    required this.satisFiat3,
    required this.satisFiat4,
    required this.satDovTip,
    required this.dovAlisFiat,
    required this.dovMalFiat,
    required this.dovSatisFiat,
    required this.muhDetaykodu,
    required this.birimAgirlik,
    required this.nakliyetTut,
    required this.kdvOrani,
    required this.alisDovTip,
    required this.depoKodu,
    required this.dovTur,
    required this.uretOlcuBr,
    required this.bilesenmi,
    required this.mamulmu,
    required this.formulToplami,
    required this.updateKodu,
    required this.maxIskonto,
    required this.eczaciKari,
    required this.miktar,
    required this.malFazlasi,
    required this.kdvTenzilOran,
    required this.kilit,
    required this.oncekiKod,
    required this.sonrakiKod,
    required this.barkod1,
    required this.barkod2,
    required this.barkod3,
    required this.alisKdvKodu,
    required this.alisFiat1,
    required this.alisFiat2,
    required this.alisFiat3,
    required this.alisFiat4,
    required this.lotSize,
    required this.minSipMiktar,
    required this.sabitSipAralik,
    required this.sipPolitikasi,
    required this.ozellikKodu1,
    required this.ozellikKodu2,
    required this.ozellikKodu3,
    required this.ozellikKodu4,
    required this.ozellikKodu5,
    required this.opsiyonKodu1,
    required this.opsiyonKodu2,
    required this.opsiyonKodu3,
    required this.opsiyonKodu4,
    required this.opsiyonKodu5,
    required this.bilesenOpKodu,
    required this.sipVerMal,
    required this.eldeBulMal,
    required this.yilTahKulMik,
    required this.ekonSipMiktar,
    required this.eskiRecete,
    required this.otomatikUretim,
    required this.alfkod,
    required this.safkod,
    required this.kodturu,
    required this.sYedek1,
    required this.sYedek2,
    required this.fYedek3,
    required this.fYedek4,
    required this.cYedek5,
    required this.cYedek6,
    required this.bYedek7,
    required this.iYedek8,
    required this.lYedek9,
    required this.dYedek10,
    required this.girisSeri,
    required this.cikisSeri,
    required this.seriBak,
    required this.seriMik,
    required this.seriGirOt,
    required this.seriCikOt,
    required this.seriBaslangic,
    required this.fiyatkodu,
    required this.fiyatsirasi,
    required this.planlanacak,
    required this.lotSizecustomer,
    required this.minSipMiktarcustomer,
    required this.gumruktarifekodu,
    required this.abckodu,
    required this.performanskodu,
    required this.saticisipkilit,
    required this.musterisipkilit,
    required this.satinalmakilit,
    required this.satiskilit,
    required this.en,
    required this.boy,
    required this.genislik,
    required this.siplimitvar,
    required this.sonstokkodu,
    required this.onaytipi,
    required this.onaynum,
    required this.fiktifMam,
    required this.yapilandir,
    required this.sbomvarmi,
    required this.baglistokkod,
    required this.yapkod,
    required this.tur,
    required this.mgrup,
    required this.kayittarihi,
    required this.kayityapankul,
    required this.duzeltmetarihi,
    required this.duzeltmeyapankul,
    required this.ingisim,
    required this.birimMaliyet,
    required this.kull1n,
    required this.kull2n,
    required this.kull3n,
    required this.kull4n,
    required this.kull5n,
    required this.kull6n,
    required this.kull7n,
    required this.kull8n,
    required this.kull1s,
    required this.kull2s,
    required this.kull3s,
    required this.kull4s,
    required this.kull5s,
    required this.kull6s,
    required this.kull7s,
    required this.kull8s,
    required this.sonSatalFiat,
    required this.sonSatalTar,
    required this.fYedek1,
    required this.fYedek2,
    required this.cYedek1,
    required this.cYedek2,
    required this.bYedek1,
    required this.iYedek1,
    required this.lYedek1,
    required this.sonsattar,
    required this.dagiticiKodu,
    required this.curbirimMaliyet,
    required this.ambarmasraf,
    required this.ambarcikisyeri,
  });
  final int subeKodu;
  final int isletmeKodu;
  final String stokKodu;
  final String ureticiKodu;
  final String stokAdi;
  final int grupKodu;
  final String kod1;
  final String kod2;
  final String kod3;
  final String kod4;
  final String kod5;
  final String saticiKodu;
  final String olcuBr1;
  final String olcuBr2;
  final Decimal pay1;
  final Decimal payda1;
  final String olcuBr3;
  final Decimal pay2;
  final Decimal payda2;
  final String fiatBirimi;
  final Decimal azamiStok;
  final Decimal asgariStok;
  final Decimal teminSuresi;
  final Decimal kulMik;
  final int riskSuresi;
  final String zamanBirimi;
  final Decimal satisFiat1;
  final Decimal satisFiat2;
  final Decimal satisFiat3;
  final Decimal satisFiat4;
  final int satDovTip;
  final Decimal dovAlisFiat;
  final Decimal dovMalFiat;
  final Decimal dovSatisFiat;
  final int muhDetaykodu;
  final Decimal birimAgirlik;
  final Decimal nakliyetTut;
  final Decimal kdvOrani;
  final int alisDovTip;
  final int depoKodu;
  final int dovTur;
  final int uretOlcuBr;
  final String bilesenmi;
  final String mamulmu;
  final Decimal formulToplami;
  final String updateKodu;
  final Decimal maxIskonto;
  final Decimal eczaciKari;
  final Decimal miktar;
  final Decimal malFazlasi;
  final Decimal kdvTenzilOran;
  final String kilit;
  final String oncekiKod;
  final String sonrakiKod;
  final String barkod1;
  final String barkod2;
  final String barkod3;
  final Decimal alisKdvKodu;
  final Decimal alisFiat1;
  final Decimal alisFiat2;
  final Decimal alisFiat3;
  final Decimal alisFiat4;
  final Decimal lotSize;
  final Decimal minSipMiktar;
  final int sabitSipAralik;
  final String sipPolitikasi;
  final int ozellikKodu1;
  final int ozellikKodu2;
  final int ozellikKodu3;
  final int ozellikKodu4;
  final int ozellikKodu5;
  final int opsiyonKodu1;
  final int opsiyonKodu2;
  final int opsiyonKodu3;
  final int opsiyonKodu4;
  final int opsiyonKodu5;
  final int bilesenOpKodu;
  final Decimal sipVerMal;
  final Decimal eldeBulMal;
  final Decimal yilTahKulMik;
  final Decimal ekonSipMiktar;
  final String eskiRecete;
  final String otomatikUretim;
  final String alfkod;
  final String safkod;
  final String kodturu;
  final String sYedek1;
  final String sYedek2;
  final Decimal fYedek3;
  final Decimal fYedek4;
  final String cYedek5;
  final String cYedek6;
  final int bYedek7;
  final int iYedek8;
  final int lYedek9;
  final String dYedek10;
  final String girisSeri;
  final String cikisSeri;
  final String seriBak;
  final String seriMik;
  final String seriGirOt;
  final String seriCikOt;
  final String seriBaslangic;
  final String fiyatkodu;
  final int fiyatsirasi;
  final String planlanacak;
  final Decimal lotSizecustomer;
  final Decimal minSipMiktarcustomer;
  final String gumruktarifekodu;
  final String abckodu;
  final String performanskodu;
  final String saticisipkilit;
  final String musterisipkilit;
  final String satinalmakilit;
  final String satiskilit;
  final Decimal en;
  final Decimal boy;
  final Decimal genislik;
  final String siplimitvar;
  final String sonstokkodu;
  final String onaytipi;
  final int onaynum;
  final String fiktifMam;
  final String yapilandir;
  final String sbomvarmi;
  final String baglistokkod;
  final String yapkod;

  final String tur;
  final String mgrup;
  final String kayittarihi;
  final String kayityapankul;
  final String duzeltmetarihi;
  final String duzeltmeyapankul;
  final String ingisim;
  final Decimal birimMaliyet;
  final Decimal kull1n;
  final Decimal kull2n;
  final Decimal kull3n;
  final Decimal kull4n;
  final Decimal kull5n;
  final Decimal kull6n;
  final Decimal kull7n;
  final Decimal kull8n;
  final String kull1s;
  final String kull2s;
  final String kull3s;
  final String kull4s;
  final String kull5s;
  final String kull6s;
  final String kull7s;
  final String kull8s;
  final Decimal sonSatalFiat;
  final String sonSatalTar;
  final Decimal fYedek1;
  final Decimal fYedek2;
  final String cYedek1;
  final String cYedek2;
  final int bYedek1;
  final int iYedek1;
  final int lYedek1;
  final String sonsattar;
  final String dagiticiKodu;
  final Decimal curbirimMaliyet;
  final String ambarmasraf;
  final String ambarcikisyeri;

  static String subeKoduStr = "SUBE_KODU";
  static String isletmeKoduStr = "ISLETME_KODU";
  static String stokKoduStr = "STOK_KODU";
  static String ureticiKoduStr = "URETICI_KODU";
  static String stokAdiStr = "STOK_ADI";
  static String grupKoduStr = "GRUP_KODU";
  static String kod1Str = "KOD_1";
  static String kod2Str = "KOD_2";
  static String kod3Str = "KOD_3";
  static String kod4Str = "KOD_4";
  static String kod5Str = "KOD_5";
  static String saticiKoduStr = "SATICI_KODU";
  static String olcuBr1Str = "OLCU_BR1";
  static String olcuBr2Str = "OLCU_BR2";
  static String pay1Str = "PAY_1";
  static String payda1Str = "PAYDA_1";
  static String olcuBr3Str = "OLCU_BR3";
  static String pay2Str = "PAY2";
  static String payda2Str = "PAYDA2";
  static String fiatBirimiStr = "FIAT_BIRIMI";
  static String azamiStokStr = "AZAMI_STOK";
  static String asgariStokStr = "ASGARI_STOK";
  static String teminSuresiStr = "TEMIN_SURESI";
  static String kulMikStr = "KUL_MIK";
  static String riskSuresiStr = "RISK_SURESI";
  static String zamanBirimiStr = "ZAMAN_BIRIMI";
  static String satisFiat1Str = "SATIS_FIAT1";
  static String satisFiat2Str = "SATIS_FIAT2";
  static String satisFiat3Str = "SATIS_FIAT3";
  static String satisFiat4Str = "SATIS_FIAT4";
  static String satDovTipStr = "SAT_DOV_TIP";
  static String dovAlisFiatStr = "DOV_ALIS_FIAT";
  static String dovMalFiatStr = "DOV_MAL_FIAT";
  static String dovSatisFiatStr = "DOV_SATIS_FIAT";
  static String muhDetaykoduStr = "MUH_DETAYKODU";
  static String birimAgirlikStr = "BIRIM_AGIRLIK";
  static String nakliyetTutStr = "NAKLIYET_TUT";
  static String kdvOraniStr = "KDV_ORANI";
  static String alisDovTipStr = "ALIS_DOV_TIP";
  static String depoKoduStr = "DEPO_KODU";
  static String dovTurStr = "DOV_TUR";
  static String uretOlcuBrStr = "URET_OLCU_BR";
  static String bilesenmiStr = "BILESENMI";
  static String mamulmuStr = "MAMULMU";
  static String formulToplamiStr = "FORMUL_TOPLAMI";
  static String updateKoduStr = "UPDATE_KODU";
  static String maxIskontoStr = "MAX_ISKONTO";
  static String eczaciKariStr = "ECZACI_KARI";
  static String miktarStr = "MIKTAR";
  static String malFazlasiStr = "MAL_FAZLASI";
  static String kdvTenzilOranStr = "KDV_TENZIL_ORAN";
  static String kilitStr = "KILIT";
  static String oncekiKodStr = "ONCEKI_KOD";
  static String sonrakiKodStr = "SONRAKI_KOD";
  static String barkod1Str = "BARKOD1";
  static String barkod2Str = "BARKOD2";
  static String barkod3Str = "BARKOD3";
  static String alisKdvKoduStr = "ALIS_KDV_KODU";
  static String alisFiat1Str = "ALIS_FIAT1";
  static String alisFiat2Str = "ALIS_FIAT2";
  static String alisFiat3Str = "ALIS_FIAT3";
  static String alisFiat4Str = "ALIS_FIAT4";
  static String lotSizeStr = "LOT_SIZE";
  static String minSipMiktarStr = "MIN_SIP_MIKTAR";
  static String sabitSipAralikStr = "SABIT_SIP_ARALIK";
  static String sipPolitikasiStr = "SIP_POLITIKASI";
  static String ozellikKodu1Str = "OZELLIK_KODU1";
  static String ozellikKodu2Str = "OZELLIK_KODU2";
  static String ozellikKodu3Str = "OZELLIK_KODU3";
  static String ozellikKodu4Str = "OZELLIK_KODU4";
  static String ozellikKodu5Str = "OZELLIK_KODU5";
  static String opsiyonKodu1Str = "OPSIYON_KODU1";
  static String opsiyonKodu2Str = "OPSIYON_KODU2";
  static String opsiyonKodu3Str = "OPSIYON_KODU3";
  static String opsiyonKodu4Str = "OPSIYON_KODU4";
  static String opsiyonKodu5Str = "OPSIYON_KODU5";
  static String bilesenOpKoduStr = "BILESEN_OP_KODU";
  static String sipVerMalStr = "SIP_VER_MAL";
  static String eldeBulMalStr = "ELDE_BUL_MAL";
  static String yilTahKulMikStr = "YIL_TAH_KUL_MIK";
  static String ekonSipMiktarStr = "EKON_SIP_MIKTAR";
  static String eskiReceteStr = "ESKI_RECETE";
  static String otomatikUretimStr = "OTOMATIK_URETIM";
  static String alfkodStr = "ALFKOD";
  static String safkodStr = "SAFKOD";
  static String kodturuStr = "KODTURU";
  static String sYedek1Str = "S_YEDEK1";
  static String sYedek2Str = "S_YEDEK2";
  static String fYedek3Str = "F_YEDEK3";
  static String fYedek4Str = "F_YEDEK4";
  static String cYedek5Str = "C_YEDEK5";
  static String cYedek6Str = "C_YEDEK6";
  static String bYedek7Str = "B_YEDEK7";
  static String iYedek8Str = "I_YEDEK8";
  static String lYedek9Str = "L_YEDEK9";
  static String dYedek10Str = "D_YEDEK10";
  static String girisSeriStr = "GIRIS_SERI";
  static String cikisSeriStr = "CIKIS_SERI";
  static String seriBakStr = "SERI_BAK";
  static String seriMikStr = "SERI_MIK";
  static String seriGirOtStr = "SERI_GIR_OT";
  static String seriCikOtStr = "SERI_CIK_OT";
  static String seriBaslangicStr = "SERI_BASLANGIC";
  static String fiyatkoduStr = "FIYATKODU";
  static String fiyatsirasiStr = "FIYATSIRASI";
  static String planlanacakStr = "PLANLANACAK";
  static String lotSizecustomerStr = "LOT_SIZECUSTOMER";
  static String minSipMiktarcustomerStr = "MIN_SIP_MIKTARCUSTOMER";
  static String gumruktarifekoduStr = "GUMRUKTARIFEKODU";
  static String abckoduStr = "ABCKODU";
  static String performanskoduStr = "PERFORMANSKODU";
  static String saticisipkilitStr = "SATICISIPKILIT";
  static String musterisipkilitStr = "MUSTERISIPKILIT";
  static String satinalmakilitStr = "SATINALMAKILIT";
  static String satiskilitStr = "SATISKILIT";
  static String enStr = "EN";
  static String boyStr = "BOY";
  static String genislikStr = "GENISLIK";
  static String siplimitvarStr = "SIPLIMITVAR";
  static String sonstokkoduStr = "SONSTOKKODU";
  static String onaytipiStr = "ONAYTIPI";
  static String onaynumStr = "ONAYNUM";
  static String fiktifMamStr = "FIKTIF_MAM";
  static String yapilandirStr = "YAPILANDIR";
  static String sbomvarmiStr = "SBOMVARMI";
  static String baglistokkodStr = "BAGLISTOKKOD";
  static String yapkodStr = "YAPKOD";
  static String turStr = "TUR";
  static String mgrupStr = "MGRUP";
  static String kayittarihiStr = "KAYITTARIHI";
  static String kayityapankulStr = "KAYITYAPANKUL";
  static String duzeltmetarihiStr = "DUZELTMETARIHI";
  static String duzeltmeyapankulStr = "DUZELTMEYAPANKUL";
  static String ingisimStr = "INGISIM";
  static String birimMaliyetStr = "BIRIM_MALIYET";
  static String kull1nStr = "KULL1N";
  static String kull2nStr = "KULL2N";
  static String kull3nStr = "KULL3N";
  static String kull4nStr = "KULL4N";
  static String kull5nStr = "KULL5N";
  static String kull6nStr = "KULL6N";
  static String kull7nStr = "KULL7N";
  static String kull8nStr = "KULL8N";
  static String kull1sStr = "KULL1S";
  static String kull2sStr = "KULL2S";
  static String kull3sStr = "KULL3S";
  static String kull4sStr = "KULL4S";
  static String kull5sStr = "KULL5S";
  static String kull6sStr = "KULL6S";
  static String kull7sStr = "KULL7S";
  static String kull8sStr = "KULL8S";
  static String sonSatalFiatStr = "SON_SATAL_FIAT";
  static String sonSatalTarStr = "SON_SATAL_TAR";
  static String fYedek1Str = "F_YEDEK1";
  static String fYedek2Str = "F_YEDEK2";
  static String cYedek1Str = "C_YEDEK1";
  static String cYedek2Str = "C_YEDEK2";
  static String bYedek1Str = "B_YEDEK1";
  static String iYedek1Str = "I_YEDEK1";
  static String lYedek1Str = "L_YEDEK1";
  static String sonsattarStr = "SONSATTAR";
  static String dagiticiKoduStr = "DAGITICI_KODU";
  static String curbirimMaliyetStr = "CURBIRIM_MALIYET";
  static String ambarmasrafStr = "AMBARMASRAF";
  static String ambarcikisyeriStr = "AMBARCIKISYERI";

  factory StokModel.fromJson(Map<String, dynamic> jsonData) {
    return StokModel(
      subeKodu: Degiskenler.parseInt(degisken: jsonData[subeKoduStr]),
      isletmeKodu: Degiskenler.parseInt(degisken: jsonData[isletmeKoduStr]),
      stokKodu: Degiskenler.parseString(degisken: jsonData[stokKoduStr]),
      ureticiKodu: Degiskenler.parseString(degisken: jsonData[ureticiKoduStr]),
      stokAdi: Degiskenler.parseString(degisken: jsonData[stokAdiStr]),
      grupKodu: Degiskenler.parseInt(degisken: jsonData[grupKoduStr]),
      kod1: Degiskenler.parseString(degisken: jsonData[kod1Str]),
      kod2: Degiskenler.parseString(degisken: jsonData[kod2Str]),
      kod3: Degiskenler.parseString(degisken: jsonData[kod3Str]),
      kod4: Degiskenler.parseString(degisken: jsonData[kod4Str]),
      kod5: Degiskenler.parseString(degisken: jsonData[kod5Str]),
      saticiKodu: Degiskenler.parseString(degisken: jsonData[saticiKoduStr]),
      olcuBr1: Degiskenler.parseString(degisken: jsonData[olcuBr1Str]),
      olcuBr2: Degiskenler.parseString(degisken: jsonData[olcuBr2Str]),
      pay1: Degiskenler.parseDecimal(degisken: jsonData[pay1Str]),
      payda1: Degiskenler.parseDecimal(degisken: jsonData[payda1Str]),
      olcuBr3: Degiskenler.parseString(degisken: jsonData[olcuBr3Str]),
      pay2: Degiskenler.parseDecimal(degisken: jsonData[pay2Str]),
      payda2: Degiskenler.parseDecimal(degisken: jsonData[payda2Str]),
      fiatBirimi: Degiskenler.parseString(degisken: jsonData[fiatBirimiStr]),
      azamiStok: Degiskenler.parseDecimal(degisken: jsonData[azamiStokStr]),
      asgariStok: Degiskenler.parseDecimal(degisken: jsonData[asgariStokStr]),
      teminSuresi: Degiskenler.parseDecimal(degisken: jsonData[teminSuresiStr]),
      kulMik: Degiskenler.parseDecimal(degisken: jsonData[kulMikStr]),
      riskSuresi: Degiskenler.parseInt(degisken: jsonData[riskSuresiStr]),
      zamanBirimi: Degiskenler.parseString(degisken: jsonData[zamanBirimiStr]),
      satisFiat1: Degiskenler.parseDecimal(degisken: jsonData[satisFiat1Str]),
      satisFiat2: Degiskenler.parseDecimal(degisken: jsonData[satisFiat2Str]),
      satisFiat3: Degiskenler.parseDecimal(degisken: jsonData[satisFiat3Str]),
      satisFiat4: Degiskenler.parseDecimal(degisken: jsonData[satisFiat4Str]),
      satDovTip: Degiskenler.parseInt(degisken: jsonData[satDovTipStr]),
      dovAlisFiat: Degiskenler.parseDecimal(degisken: jsonData[dovAlisFiatStr]),
      dovMalFiat: Degiskenler.parseDecimal(degisken: jsonData[dovMalFiatStr]),
      dovSatisFiat:
          Degiskenler.parseDecimal(degisken: jsonData[dovSatisFiatStr]),
      muhDetaykodu: Degiskenler.parseInt(degisken: jsonData[muhDetaykoduStr]),
      birimAgirlik:
          Degiskenler.parseDecimal(degisken: jsonData[birimAgirlikStr]),
      nakliyetTut: Degiskenler.parseDecimal(degisken: jsonData[nakliyetTutStr]),
      kdvOrani: Degiskenler.parseDecimal(degisken: jsonData[kdvOraniStr]),
      alisDovTip: Degiskenler.parseInt(degisken: jsonData[alisDovTipStr]),
      depoKodu: Degiskenler.parseInt(degisken: jsonData[depoKoduStr]),
      dovTur: Degiskenler.parseInt(degisken: jsonData[dovTurStr]),
      uretOlcuBr: Degiskenler.parseInt(degisken: jsonData[uretOlcuBrStr]),
      bilesenmi: Degiskenler.parseString(degisken: jsonData[bilesenmiStr]),
      mamulmu: Degiskenler.parseString(degisken: jsonData[mamulmuStr]),
      formulToplami:
          Degiskenler.parseDecimal(degisken: jsonData[formulToplamiStr]),
      updateKodu: Degiskenler.parseString(degisken: jsonData[updateKoduStr]),
      maxIskonto: Degiskenler.parseDecimal(degisken: jsonData[maxIskontoStr]),
      eczaciKari: Degiskenler.parseDecimal(degisken: jsonData[eczaciKariStr]),
      miktar: Degiskenler.parseDecimal(degisken: jsonData[miktarStr]),
      malFazlasi: Degiskenler.parseDecimal(degisken: jsonData[malFazlasiStr]),
      kdvTenzilOran:
          Degiskenler.parseDecimal(degisken: jsonData[kdvTenzilOranStr]),
      kilit: Degiskenler.parseString(degisken: jsonData[kilitStr]),
      oncekiKod: Degiskenler.parseString(degisken: jsonData[oncekiKodStr]),
      sonrakiKod: Degiskenler.parseString(degisken: jsonData[sonrakiKodStr]),
      barkod1: Degiskenler.parseString(degisken: jsonData[barkod1Str]),
      barkod2: Degiskenler.parseString(degisken: jsonData[barkod2Str]),
      barkod3: Degiskenler.parseString(degisken: jsonData[barkod3Str]),
      alisKdvKodu: Degiskenler.parseDecimal(degisken: jsonData[alisKdvKoduStr]),
      alisFiat1: Degiskenler.parseDecimal(degisken: jsonData[alisFiat1Str]),
      alisFiat2: Degiskenler.parseDecimal(degisken: jsonData[alisFiat2Str]),
      alisFiat3: Degiskenler.parseDecimal(degisken: jsonData[alisFiat3Str]),
      alisFiat4: Degiskenler.parseDecimal(degisken: jsonData[alisFiat4Str]),
      lotSize: Degiskenler.parseDecimal(degisken: jsonData[lotSizeStr]),
      minSipMiktar:
          Degiskenler.parseDecimal(degisken: jsonData[minSipMiktarStr]),
      sabitSipAralik:
          Degiskenler.parseInt(degisken: jsonData[sabitSipAralikStr]),
      sipPolitikasi:
          Degiskenler.parseString(degisken: jsonData[sipPolitikasiStr]),
      ozellikKodu1: Degiskenler.parseInt(degisken: jsonData[ozellikKodu1Str]),
      ozellikKodu2: Degiskenler.parseInt(degisken: jsonData[ozellikKodu2Str]),
      ozellikKodu3: Degiskenler.parseInt(degisken: jsonData[ozellikKodu3Str]),
      ozellikKodu4: Degiskenler.parseInt(degisken: jsonData[ozellikKodu4Str]),
      ozellikKodu5: Degiskenler.parseInt(degisken: jsonData[ozellikKodu5Str]),
      opsiyonKodu1: Degiskenler.parseInt(degisken: jsonData[opsiyonKodu1Str]),
      opsiyonKodu2: Degiskenler.parseInt(degisken: jsonData[opsiyonKodu2Str]),
      opsiyonKodu3: Degiskenler.parseInt(degisken: jsonData[opsiyonKodu3Str]),
      opsiyonKodu4: Degiskenler.parseInt(degisken: jsonData[opsiyonKodu4Str]),
      opsiyonKodu5: Degiskenler.parseInt(degisken: jsonData[opsiyonKodu5Str]),
      bilesenOpKodu: Degiskenler.parseInt(degisken: jsonData[bilesenOpKoduStr]),
      sipVerMal: Degiskenler.parseDecimal(degisken: jsonData[sipVerMalStr]),
      eldeBulMal: Degiskenler.parseDecimal(degisken: jsonData[eldeBulMalStr]),
      yilTahKulMik:
          Degiskenler.parseDecimal(degisken: jsonData[yilTahKulMikStr]),
      ekonSipMiktar:
          Degiskenler.parseDecimal(degisken: jsonData[ekonSipMiktarStr]),
      eskiRecete: Degiskenler.parseString(degisken: jsonData[eskiReceteStr]),
      otomatikUretim:
          Degiskenler.parseString(degisken: jsonData[otomatikUretimStr]),
      alfkod: Degiskenler.parseString(degisken: jsonData[alfkodStr]),
      safkod: Degiskenler.parseString(degisken: jsonData[safkodStr]),
      kodturu: Degiskenler.parseString(degisken: jsonData[kodturuStr]),
      sYedek1: Degiskenler.parseString(degisken: jsonData[sYedek1Str]),
      sYedek2: Degiskenler.parseString(degisken: jsonData[sYedek2Str]),
      fYedek3: Degiskenler.parseDecimal(degisken: jsonData[fYedek3Str]),
      fYedek4: Degiskenler.parseDecimal(degisken: jsonData[fYedek4Str]),
      cYedek5: Degiskenler.parseString(degisken: jsonData[cYedek5Str]),
      cYedek6: Degiskenler.parseString(degisken: jsonData[cYedek6Str]),
      bYedek7: Degiskenler.parseInt(degisken: jsonData[bYedek7Str]),
      iYedek8: Degiskenler.parseInt(degisken: jsonData[iYedek8Str]),
      lYedek9: Degiskenler.parseInt(degisken: jsonData[lYedek9Str]),
      dYedek10: Degiskenler.parseString(degisken: jsonData[dYedek10Str]),
      girisSeri: Degiskenler.parseString(degisken: jsonData[girisSeriStr]),
      cikisSeri: Degiskenler.parseString(degisken: jsonData[cikisSeriStr]),
      seriBak: Degiskenler.parseString(degisken: jsonData[seriBakStr]),
      seriMik: Degiskenler.parseString(degisken: jsonData[seriMikStr]),
      seriGirOt: Degiskenler.parseString(degisken: jsonData[seriGirOtStr]),
      seriCikOt: Degiskenler.parseString(degisken: jsonData[seriCikOtStr]),
      seriBaslangic:
          Degiskenler.parseString(degisken: jsonData[seriBaslangicStr]),
      fiyatkodu: Degiskenler.parseString(degisken: jsonData[fiyatkoduStr]),
      fiyatsirasi: Degiskenler.parseInt(degisken: jsonData[fiyatsirasiStr]),
      planlanacak: Degiskenler.parseString(degisken: jsonData[planlanacakStr]),
      lotSizecustomer:
          Degiskenler.parseDecimal(degisken: jsonData[lotSizecustomerStr]),
      minSipMiktarcustomer:
          Degiskenler.parseDecimal(degisken: jsonData[minSipMiktarcustomerStr]),
      gumruktarifekodu:
          Degiskenler.parseString(degisken: jsonData[gumruktarifekoduStr]),
      abckodu: Degiskenler.parseString(degisken: jsonData[abckoduStr]),
      performanskodu:
          Degiskenler.parseString(degisken: jsonData[performanskoduStr]),
      saticisipkilit:
          Degiskenler.parseString(degisken: jsonData[saticisipkilitStr]),
      musterisipkilit:
          Degiskenler.parseString(degisken: jsonData[musterisipkilitStr]),
      satinalmakilit:
          Degiskenler.parseString(degisken: jsonData[satinalmakilitStr]),
      satiskilit: Degiskenler.parseString(degisken: jsonData[satiskilitStr]),
      en: Degiskenler.parseDecimal(degisken: jsonData[enStr]),
      boy: Degiskenler.parseDecimal(degisken: jsonData[boyStr]),
      genislik: Degiskenler.parseDecimal(degisken: jsonData[genislikStr]),
      siplimitvar: Degiskenler.parseString(degisken: jsonData[siplimitvarStr]),
      sonstokkodu: Degiskenler.parseString(degisken: jsonData[sonstokkoduStr]),
      onaytipi: Degiskenler.parseString(degisken: jsonData[onaytipiStr]),
      onaynum: Degiskenler.parseInt(degisken: jsonData[onaynumStr]),
      fiktifMam: Degiskenler.parseString(degisken: jsonData[fiktifMamStr]),
      yapilandir: Degiskenler.parseString(degisken: jsonData[yapilandirStr]),
      sbomvarmi: Degiskenler.parseString(degisken: jsonData[sbomvarmiStr]),
      baglistokkod:
          Degiskenler.parseString(degisken: jsonData[baglistokkodStr]),
      yapkod: Degiskenler.parseString(degisken: jsonData[yapkodStr]),
      tur: Degiskenler.parseString(degisken: jsonData[turStr]),
      mgrup: Degiskenler.parseString(degisken: jsonData[mgrupStr]),
      kayittarihi: Degiskenler.parseString(degisken: jsonData[kayittarihiStr]),
      kayityapankul:
          Degiskenler.parseString(degisken: jsonData[kayityapankulStr]),
      duzeltmetarihi:
          Degiskenler.parseString(degisken: jsonData[duzeltmetarihiStr]),
      duzeltmeyapankul:
          Degiskenler.parseString(degisken: jsonData[duzeltmeyapankulStr]),
      ingisim: Degiskenler.parseString(degisken: jsonData[ingisimStr]),
      birimMaliyet:
          Degiskenler.parseDecimal(degisken: jsonData[birimMaliyetStr]),
      kull1n: Degiskenler.parseDecimal(degisken: jsonData[kull1nStr]),
      kull2n: Degiskenler.parseDecimal(degisken: jsonData[kull2nStr]),
      kull3n: Degiskenler.parseDecimal(degisken: jsonData[kull3nStr]),
      kull4n: Degiskenler.parseDecimal(degisken: jsonData[kull4nStr]),
      kull5n: Degiskenler.parseDecimal(degisken: jsonData[kull5nStr]),
      kull6n: Degiskenler.parseDecimal(degisken: jsonData[kull6nStr]),
      kull7n: Degiskenler.parseDecimal(degisken: jsonData[kull7nStr]),
      kull8n: Degiskenler.parseDecimal(degisken: jsonData[kull8nStr]),
      kull1s: Degiskenler.parseString(degisken: jsonData[kull1sStr]),
      kull2s: Degiskenler.parseString(degisken: jsonData[kull2sStr]),
      kull3s: Degiskenler.parseString(degisken: jsonData[kull3sStr]),
      kull4s: Degiskenler.parseString(degisken: jsonData[kull4sStr]),
      kull5s: Degiskenler.parseString(degisken: jsonData[kull5sStr]),
      kull6s: Degiskenler.parseString(degisken: jsonData[kull6sStr]),
      kull7s: Degiskenler.parseString(degisken: jsonData[kull7sStr]),
      kull8s: Degiskenler.parseString(degisken: jsonData[kull8sStr]),
      sonSatalFiat:
          Degiskenler.parseDecimal(degisken: jsonData[sonSatalFiatStr]),
      sonSatalTar: Degiskenler.parseString(degisken: jsonData[sonSatalTarStr]),
      fYedek1: Degiskenler.parseDecimal(degisken: jsonData[fYedek1Str]),
      fYedek2: Degiskenler.parseDecimal(degisken: jsonData[fYedek2Str]),
      cYedek1: Degiskenler.parseString(degisken: jsonData[cYedek1Str]),
      cYedek2: Degiskenler.parseString(degisken: jsonData[cYedek2Str]),
      bYedek1: Degiskenler.parseInt(degisken: jsonData[bYedek1Str]),
      iYedek1: Degiskenler.parseInt(degisken: jsonData[iYedek1Str]),
      lYedek1: Degiskenler.parseInt(degisken: jsonData[lYedek1Str]),
      sonsattar: Degiskenler.parseString(degisken: jsonData[sonsattarStr]),
      dagiticiKodu:
          Degiskenler.parseString(degisken: jsonData[dagiticiKoduStr]),
      curbirimMaliyet:
          Degiskenler.parseDecimal(degisken: jsonData[curbirimMaliyetStr]),
      ambarmasraf: Degiskenler.parseString(degisken: jsonData[ambarmasrafStr]),
      ambarcikisyeri:
          Degiskenler.parseString(degisken: jsonData[ambarcikisyeriStr]),
    );
  }
  String kayitTarihiDuzen() {
    // Veritabanı örnek tarih 2015-05-28 10:04:30.000
    if (kayittarihi.length >= 16) {
      String yil = kayittarihi.substring(0, 4);
      String ay = kayittarihi.substring(5, 7);
      String gun = kayittarihi.substring(8, 10);
      String saat = kayittarihi.substring(11, 13);
      String dakika = kayittarihi.substring(14, 16);
      return "$gun.$ay.$yil $saat:$dakika";
    } else {
      return kayittarihi;
    }
  }
}
