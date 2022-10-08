import '../veritabani/degiskenler.dart';

class StokModel {
  StokModel({
    required this.stokKodu,
  });
  final String stokKodu;

  static String stokKoduStr = "STOK_KODU";

  factory StokModel.fromJson(Map<String, dynamic> jsonData) {
    return StokModel(
      stokKodu: Degiskenler.parseString(yazi: jsonData[stokKoduStr]),
    );
  }
}
