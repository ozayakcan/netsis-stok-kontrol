class Konumlar {
  Konumlar({
    required this.host,
  });
  final String host;

  factory Konumlar.of(String host) {
    return Konumlar(host: host);
  }
  String get url => "http://$host:8080";

  String get stoklar => "$url/api/stoklar";
  String get stokHareketleri => "$stoklar/hareketler";
}
