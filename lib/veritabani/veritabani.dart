import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:netsisstok/model.dart/stok.dart';
import 'package:netsisstok/veritabani/konumlar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model.dart/veritabani_bilgileri.dart';

typedef OnSaveError = void Function(String hata);

class Veritabani {
  static const String veritabaniBilgileriStr = "veritabaniBilgileri";
  static const String veritabaniBaglandiStr = "veritabaniBaglandii";

  static Future<String> response({
    required String url,
    Map<String, String>? postVerileri,
  }) async {
    final headers = {
      HttpHeaders.accessControlAllowOriginHeader: "*",
      HttpHeaders.accessControlAllowCredentialsHeader: "true",
      HttpHeaders.accessControlAllowMethodsHeader:
          "GET, POST, OPTIONS, DELETE, PUT",
      HttpHeaders.accessControlMaxAgeHeader: "86400",
    };
    var body = json.encode(postVerileri);
    if (kDebugMode) {
      print("Body: $body");
    }
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: postVerileri,
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  static Future<Map<String, dynamic>> map({
    required String url,
    Map<String, String>? postVerileri,
  }) async {
    return json.decode(await response(
      url: url,
      postVerileri: postVerileri,
    ));
  }

  static Future<List> list({
    required String url,
    Map<String, String>? postVerileri,
  }) async {
    return json.decode(await response(
      url: url,
      postVerileri: postVerileri,
    ));
  }

  static Future<void> veritabaniBilgileriKaydet({
    required VeritabaniBilgileriModel veritabaniBilgileriModel,
    VoidCallback? beforeSave,
    VoidCallback? onSaveSuccess,
    OnSaveError? onSaveError,
  }) async {
    beforeSave?.call();
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setStringList(
          veritabaniBilgileriStr, veritabaniBilgileriModel.toList());
      onSaveSuccess?.call();
    } catch (e) {
      if (kDebugMode) {
        print("Veritabanı Bilgileri Kaydedilemedi! Hata: ${e.toString()}");
      }
      onSaveError?.call("Bir hata oluştu! Lütfen tekrar deneyin!");
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

  static Future<List<StokModel>> stoklariGetir(
      VeritabaniBilgileriModel? veritabaniBilgileriModel) async {
    if (veritabaniBilgileriModel != null) {
      try {
        var res = await list(
          url: Konumlar.of(veritabaniBilgileriModel.host).stoklar,
          postVerileri: veritabaniBilgileriModel.toMap(),
        );
        if (kDebugMode) {
          print(res.toString());
        }
        return res.map((e) => StokModel.fromJson(e)).toList();
      } catch (e) {
        if (kDebugMode) {
          print("Stoklar alınamadı! Hata: ${e.toString()}");
        }
        return [];
      }
    } else {
      if (kDebugMode) {
        print("Stoklar alınamadı! Hata: Model degeri null");
      }
      return [];
    }
  }
}
