class ProductCategory {
  int? id;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;
  bool? isHidden;
  String? name;
  bool? isFeatured;

  ProductCategory(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.isHidden,
    this.name,
    this.isFeatured,
  );

  // Convert a ProductCategory into a Map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_deleted': isDeleted,
      'is_hidden': isHidden,
      'name': name,
      'is_featured': isFeatured,
    };
  }

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      json['id'] as int?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['is_deleted'] as bool?,
      json['is_hidden'] as bool?,
      json['name'] as String?,
      json['is_featured'] as bool?,
    );
  }
}
