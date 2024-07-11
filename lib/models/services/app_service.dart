class AppService {
  String? name;
  String? image;
  String? description;
  String? redirectUrl;
  AppService(this.name, this.image, this.description, this.redirectUrl);

  factory AppService.fromJson(Map<String, dynamic> json) {
    return AppService(
      json['name'] as String?,
      json['image'] as String?,
      json['description'] as String?,
      json['redirect_url'] as String?,
    );
  }

  // Convert an AppService instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'redirect_url': redirectUrl,
    };
  }
}
