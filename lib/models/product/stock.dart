class Stock {
  int? stockId;
  String? size;
  int? quantity;
  double? price;

  Stock(this.stockId, this.size, this.quantity, this.price);

  // Convert a Stock object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'stock_id': stockId,
      'size': size,
      'quantity': quantity,
      'price': price,
    };
  }

  // Create a Stock object from a JSON map
  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      json['stock_id'] as int?,
      json['size'] as String?,
      json['quantity'] as int?,
      (json['price'] as num?)?.toDouble(),
    );
  }
}
