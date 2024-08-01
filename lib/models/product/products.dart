import 'package:astrology/models/product/product_color.dart';

class Products {
  int? id;
  String? name;
  String? category;
  String? description;
  String? searchTags;
  List<ProductColor>? productColor;

  Products(
    this.id,
    this.name,
    this.category,
    this.description,
    this.searchTags,
    this.productColor,
  );

  factory Products.fromJson(Map<String, dynamic> json) {
    var productColorFromJson = json['product_color'] as List?;
    List<ProductColor> productColorList = productColorFromJson != null
        ? productColorFromJson
            .map((item) => ProductColor.fromJson(item))
            .toList()
        : [];

    return Products(
      json['id'] as int?,
      json['name'] as String?,
      json['category'] as String?,
      json['description'] as String?,
      json['search_tags'] as String?,
      productColorList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'search_tags': searchTags,
      'product_color': productColor?.map((item) => item.toJson()).toList(),
    };
  }

  // factory Products.fromJson(Map<String, dynamic> json) {
  //   return Products(
  //     json['id'] as int?,
  //     json['name'] as String?,
  //     json['category'] as String?,
  //     json['description'] as String?,
  //     json['search_tags'] as String?,
  //     json['product_color'] != null
  //         ? ProductColor.fromJson(json['product_color'] as Map<String, dynamic>)
  //         : null,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'category': category,
  //     'description': description,
  //     'search_tags': searchTags,
  //     'product_color': productColor?.toJson(),
  //   };
  // }
}
