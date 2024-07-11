class Banners {
  String? title;
  String? startingDate;
  String? endingDate;
  String? image;
  String? redirectUrl;
  int? order;
  Banners(this.title, this.startingDate, this.endingDate, this.image,
      this.redirectUrl, this.order);

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      json['title'] as String?,
      json['starting_date'] as String?,
      json['ending_date'] as String?,
      json['image'] as String?,
      json['redirect_url'] as String?,
      json['order'] as int?,
    );
  }

  // Convert an Banners instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'starting_date': startingDate,
      'ending_date': endingDate,
      'image': image,
      'redirect_url': redirectUrl,
      'order': order,
    };
  }
}
