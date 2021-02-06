// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
        this.id,
        this.kilometraje='',
        this.valor= 0.0,
        this.year,
        this.disponible = true,
        this.fotoUrl,
    });

    String id;
    String kilometraje;
    double valor;
    String year;
    bool disponible;
    String fotoUrl;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id        : json["id"],
        kilometraje    : json["kilometraje"],
        valor    : json["valor"],
        year    : json["year"],
        disponible: json["disponible"],
        fotoUrl   : json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id"        : id,
        "kilometraje"    : kilometraje,
        "valor"    : valor,
         "year"    : year,
        "disponible": disponible,
        "fotoUrl"   : fotoUrl,
    };
}
