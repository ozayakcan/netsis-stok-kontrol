import 'package:flutter/material.dart';
import 'package:sql_conn/sql_conn.dart';

import 'sayfa.dart';
import 'stfl_widget.dart';

class AnaSayfa extends VarsayilanStatefulWidget {
  const AnaSayfa({
    super.key,
  });

  @override
  VarsayilanStatefulWidgetState<AnaSayfa> createState() => AnaSayfaState();
}

class AnaSayfaState extends VarsayilanStatefulWidgetState<AnaSayfa> {
  @override
  void initState() {
    super.initState();
    if (!SqlConn.isConnected) {
      // TODO Veritabanına bağlanma komutu eklenecek!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Sayfa(
      baslik: "Netsis Stok",
      icerik: Center(
        child: Text("Anasayfa"),
      ),
    );
  }
}
