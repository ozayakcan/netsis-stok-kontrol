class VeritabaniBilgileriModel {
  VeritabaniBilgileriModel({
    required this.ip,
    required this.veritabani,
    required this.kullaniciAdi,
    required this.sifre,
  });
  final String ip;
  final String veritabani;
  final String kullaniciAdi;
  final String sifre;

  static VeritabaniBilgileriModel? fromList(List<String> liste) {
    if (liste.length >= 4) {
      return VeritabaniBilgileriModel(
        ip: liste[0],
        veritabani: liste[1],
        kullaniciAdi: liste[2],
        sifre: liste[3],
      );
    } else {
      return null;
    }
  }

  List<String> toList() {
    return [
      ip,
      veritabani,
      kullaniciAdi,
      sifre,
    ];
  }
}
