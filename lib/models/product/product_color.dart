import 'package:astrology/models/product/stock.dart';

class ProductColor {
  String? color;
  String? colorCode;
  String? image;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  Stock? stock;

  ProductColor(
    this.color,
    this.colorCode,
    this.image,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.stock,
  );

  // Convert a ProductColor instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'color_code': colorCode,
      'image': image,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'image5': image5,
      'stock':
          stock?.toJson(), // Assuming Stock class has its own toJson method
    };
  }

  // Convert a JSON map to a ProductColor instance
  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      json['color'] as String?,
      json['color_code'] as String?,
      json['image'] as String?,
      json['image2'] as String?,
      json['image3'] as String?,
      json['image4'] as String?,
      json['image5'] as String?,
      json['stock'] != null
          ? Stock.fromJson(json['stock'])
          : null, // Assuming Stock class has its own fromJson method
    );
  }
}
