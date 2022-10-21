import 'package:flutter/material.dart';

import 'veritabani_kaydet.dart';

class Sayfa extends StatelessWidget {
  const Sayfa({
    super.key,
    this.appBarGoster = true,
    this.baslik = "",
    required this.icerik,
    this.yenileButonAction,
    this.yenileButonAktif = false,
  });
  final bool appBarGoster;
  final String baslik;
  final Widget icerik;
  final VoidCallback? yenileButonAction;
  final bool yenileButonAktif;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarGoster
          ? AppBar(
              toolbarHeight: 55,
              title: Text(baslik),
              actions: [
                if (yenileButonAktif)
                  IconButton(
                    onPressed: yenileButonAction,
                    icon: const Icon(
                      Icons.refresh_outlined,
                    ),
                  ),
                PopupMenuButton(
                  elevation: 2,
                  offset: const Offset(0, 55),
                  onSelected: (value) {
                    switch (value) {
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VeritabaniKaydet(),
                          ),
                        );
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.data_saver_on_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Veritabanı Bilgilerini Düzenle"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          : null,
      body: icerik,
    );
  }
}
