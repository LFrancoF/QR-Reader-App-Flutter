import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }){
      if (valor.contains('http')) {
        tipo = 'https';
      } else {
        tipo = 'geo';
      }
    }

    int? id;
    String? tipo;
    String valor;

    factory ScanModel.fromRawJson(String str) => ScanModel.fromJson(json.decode(str));

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    String toRawJson() => json.encode(toJson());

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };

    LatLng getLatLng(){
      final latLng = valor.substring(4).split(',');
      final lat = double.parse(latLng[0]);
      final lng = double.parse(latLng[1]);
      return LatLng(lat, lng);
    }

}
