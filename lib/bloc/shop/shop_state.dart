import 'package:astrology/models/product/products.dart';
import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  final bool isLoading;
  final bool isFailed;
  final List<Products>? products;
  final String? error;

  const ShopState({
    required this.isLoading,
    required this.isFailed,
    this.products,
    this.error,
  });

  ShopState.initial()
      : isLoading = false,
        isFailed = false,
        products = [],
        error = null;

  ShopState copyWith({
    bool? isLoading,
    bool? isFailed,
    List<Products>? products,
    String? error,
  }) {
    return ShopState(
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      products: products ?? this.products,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isFailed, products, error];
}
