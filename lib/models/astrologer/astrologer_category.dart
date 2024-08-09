class AstrologerCategory {
  int? id;
  String? name;

  AstrologerCategory(this.id, this.name);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory AstrologerCategory.fromJson(Map<String, dynamic> json) {
    return AstrologerCategory(
      json['id'] as int?,
      json['name'] as String?,
    );
  }
}
