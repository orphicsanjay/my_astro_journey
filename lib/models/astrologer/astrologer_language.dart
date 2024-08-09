class AstrologerLanguage {
  int? id;
  String? name;

  AstrologerLanguage(this.id, this.name);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory AstrologerLanguage.fromJson(Map<String, dynamic> json) {
    return AstrologerLanguage(
      json['id'] as int?,
      json['name'] as String?,
    );
  }
}
