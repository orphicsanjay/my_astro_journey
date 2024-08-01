import 'package:astrology/models/product/stock.dart';

class ProductColor {
  String? color;
  String? colorCode;
  List<String>? images;
  List<Stock>? stock;

  ProductColor(
    this.color,
    this.colorCode,
    this.images,
    this.stock,
  );

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'color_code': colorCode,
      'images': images,
      'stock': stock?.map((s) => s.toJson()).toList(),
    };
  }

  // Convert JSON to a ProductColor object
  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      json['color'] as String?,
      json['color_code'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['stock'] as List<dynamic>?)
          ?.map((e) => Stock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  // factory ProductColor.fromJson(Map<String, dynamic> json) {
  //   return ProductColor(
  //     json['color'],
  //     json['color_code'],
  //     json['images'] != null ? List<String>.from(json['images']) : null,
  //     json['stock'] != null ? Stock.fromJson(json['stock']) : null,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'color': color,
  //     'color_code': colorCode,
  //     'images': images,
  //     'stock': stock?.toJson(),
  //   };
  // }
}
