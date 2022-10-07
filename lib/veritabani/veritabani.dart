import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql_conn/sql_conn.dart';

import '../model.dart/veritabani_bilgileri.dart';

typedef OnSaveError = void Function(String hata);

class Veritabani {
  static const String veritabaniBilgileriStr = "veritabaniBilgileri";
  static const String veritabaniBaglandiStr = "veritabaniBaglandii";

  static Future<void> veritabaniBilgileriKaydet({
    required VeritabaniBilgileriModel veritabaniBilgileriModel,
    VoidCallback? beforeSave,
    VoidCallback? onSaveSuccess,
    OnSaveError? onSaveError,
  }) async {
    beforeSave?.call();
    try {
      await SqlConn.connect(
        ip: veritabaniBilgileriModel.ip,
        port: "1433",
        databaseName: veritabaniBilgileriModel.veritabani,
        username: veritabaniBilgileriModel.kullaniciAdi,
        password: veritabaniBilgileriModel.sifre,
      );
      if (SqlConn.isConnected) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setStringList(
            veritabaniBilgileriStr, veritabaniBilgileriModel.toList());
        onSaveSuccess?.call();
      } else {
        onSaveError?.call(
          "Veritabanına bağlanılamadı! Lütfen bilgileri kontrol edip tekrar deneyin!",
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Veritabanı Bilgileri Kaydedilemedi! Hata: ${e.toString()}");
      }
      onSaveError?.call(
          "Veritabanına bağlanılamadı! Lütfen bilgileri kontrol edip tekrar deneyin!");
    }
  }

  static Future<bool> veritabaniBaglantiDurumu() async {
    VeritabaniBilgileriModel? veritabaniBilgileriModel =
        await veritabaniBilgileriGetir();
    if (veritabaniBilgileriModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<VeritabaniBilgileriModel?> veritabaniBilgileriGetir() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      List<String> liste =
          sharedPreferences.getStringList(veritabaniBilgileriStr) ?? [];
      if (liste.isNotEmpty) {
        return VeritabaniBilgileriModel.fromList(liste);
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Veritabanı Bilgileri Alınamadı! Hata: ${e.toString()}");
      }
      return null;
    }
  }
}
