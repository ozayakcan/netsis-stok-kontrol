import '../veritabani/degiskenler.dart';

class StokModel {
  StokModel({
    required this.stokKodu,
    required this.stokAdi,
  });
  final String stokKodu;
  final String stokAdi;

  static String stokKoduStr = "STOK_KODU";
  static String stokAdiStr = "STOK_ADI";

  factory StokModel.fromJson(Map<String, dynamic> jsonData) {
    return StokModel(
      stokKodu: Degiskenler.parseString(degisken: jsonData[stokKoduStr]),
      stokAdi: Degiskenler.parseString(degisken: jsonData[stokAdiStr]),
    );
  }
}
