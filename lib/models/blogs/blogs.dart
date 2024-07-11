class Blogs {
  String? title;
  String? slug;
  String? image;
  String? description;
  String? author;

  Blogs(this.title, this.slug, this.image, this.description, this.author);

  factory Blogs.fromJson(Map<String, dynamic> json) {
    return Blogs(
      json['title'] as String?,
      json['slug'] as String?,
      json['image'] as String?,
      json['description'] as String?,
      json['author'] as String?,
    );
  }

  // Convert an Blogs instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'slug': slug,
      'image': image,
      'description': description,
      'author': author,
    };
  }
}
