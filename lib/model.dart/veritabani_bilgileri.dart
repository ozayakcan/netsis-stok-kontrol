class VeritabaniBilgileriModel {
  VeritabaniBilgileriModel({
    required this.host,
    required this.veritabaniAdi,
    required this.kullaniciAdi,
    required this.sifre,
  });
  final String host;
  final String veritabaniAdi;
  final String kullaniciAdi;
  final String sifre;

  static String hostStr = "host";
  static String veritabaniAdiStr = "veritabaniAdi";
  static String kullaniciAdiStr = "kullaniciAdi";
  static String sifreStr = "sifre";

  static VeritabaniBilgileriModel? fromList(List<String> liste) {
    if (liste.length >= 4) {
      return VeritabaniBilgileriModel(
        host: liste[0],
        veritabaniAdi: liste[1],
        kullaniciAdi: liste[2],
        sifre: liste[3],
      );
    } else {
      return null;
    }
  }

  List<String> toList() {
    return [
      host,
      veritabaniAdi,
      kullaniciAdi,
      sifre,
    ];
  }

  Map<String, String> toMap() {
    return <String, String>{
      hostStr: host,
      veritabaniAdiStr: veritabaniAdi,
      kullaniciAdiStr: kullaniciAdi,
      sifreStr: sifre,
    };
  }
}
