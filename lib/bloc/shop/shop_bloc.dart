import 'package:astrology/bloc/shop/shop_event.dart';
import 'package:astrology/bloc/shop/shop_state.dart';
import 'package:astrology/models/product/products.dart';
import 'package:astrology/network/api_response_status.dart';
import 'package:astrology/repository/shop_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final ShopRepository _shopRepository;

  ShopBloc({
    required ShopRepository shopRepository,
  })  : _shopRepository = shopRepository,
        super(ShopState.initial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(
    ShopEvent event,
    Emitter<ShopState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await emit.forEach<ApiResponseStatus<List<Products>>>(
      _shopRepository.fetchProducts(),
      onData: (response) {
        if (response.isSuccessful) {
          return state.copyWith(
            isLoading: false,
            isFailed: false,
            products: response.data,
            error: response.error,
          );
        } else {
          return state.copyWith(
            isLoading: false,
            isFailed: true,
            error: response.error,
          );
        }
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          isLoading: false,
          isFailed: true,
          error: error.toString(),
        );
      },
    );
  }
}
