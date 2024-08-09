import 'package:astrology/bloc/address/address_bloc.dart';
import 'package:astrology/bloc/appservice/appservice_bloc.dart';
import 'package:astrology/bloc/astrologer/astrologer_bloc.dart';
import 'package:astrology/bloc/auth/auth_bloc.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:astrology/bloc/shop/shop_bloc.dart';
import 'package:astrology/network/network_services.dart';
import 'package:astrology/repository/address_repository.dart';
import 'package:astrology/repository/appservice_repository.dart';
import 'package:astrology/repository/astrologer_repository.dart';
import 'package:astrology/repository/auth_repository.dart';
import 'package:astrology/repository/blogs_repository.dart';
import 'package:astrology/repository/gender_repository.dart';
import 'package:astrology/repository/news_repository.dart';
import 'package:astrology/repository/shop_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  await initDio();
  await initSharedPreferences();
  registerRepositories();

  await getIt.allReady();
  registerBlocs();
}

Future<void> initDio() async {
  getIt.registerSingleton(buildDio());
}

Future<void> initSharedPreferences() async {
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await buildSharedPreferences(),
  );
}

void registerRepositories() {
  getIt.registerLazySingleton<AddressRepository>(
    () => AddressRepository(dio: getIt()),
  );

  getIt.registerLazySingleton<AppServiceRepository>(
    () => AppServiceRepository(dio: getIt()),
  );

  getIt.registerLazySingleton<AstrologerRepository>(
    () => AstrologerRepository(dio: getIt()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(dio: getIt()),
  );

  getIt.registerLazySingleton<BlogsRepository>(
    () => BlogsRepository(dio: getIt()),
  );

  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepository(dio: getIt()),
  );

  getIt.registerLazySingleton<ShopRepository>(
    () => ShopRepository(dio: getIt()),
  );
  getIt.registerLazySingleton<GenderRepository>(
    () => GenderRepository(dio: getIt()),
  );
}

void registerBlocs() {
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      authRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<AppServiceBloc>((() => AppServiceBloc(
        appServiceRepository: getIt(),
      )));

  getIt.registerLazySingleton<AddressBloc>(
      (() => AddressBloc(addressRepository: getIt())));

  getIt.registerLazySingleton<ShopBloc>(
    () => ShopBloc(
      shopRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<CompleteProfileBloc>(
    () => CompleteProfileBloc(
      genderRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<AstrologerBloc>(
    () => AstrologerBloc(
      astrologerRepository: getIt(),
    ),
  );
}
