import 'package:astrology/network/http_service.dart';
import 'package:astrology/network/network_services.dart';
import 'package:astrology/providers/app_service_provider.dart';
import 'package:astrology/providers/astrologer_provider.dart';
import 'package:astrology/providers/auth_provider.dart';
import 'package:astrology/providers/banner_provider.dart';
import 'package:astrology/providers/blogs_provider.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/providers/district_provider.dart';
import 'package:astrology/providers/gender_provider.dart';
import 'package:astrology/providers/network_provider.dart';
import 'package:astrology/providers/preferences_provider.dart';
import 'package:astrology/providers/products_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<http.Client>(
    buildHttpClient(),
  );

  getIt.registerSingleton<HttpService>(
    HttpService(getIt<http.Client>()),
  );

  getIt.registerSingleton<CountryProvider>(
    CountryProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<AppServicesProvider>(
    AppServicesProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<AstrologerProvider>(AstrologerProvider());

  getIt.registerSingleton<AuthProvider>(
    AuthProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<BannerProvider>(
    BannerProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<BlogsProvider>(
    BlogsProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<DistrictProvider>(
    DistrictProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<GenderProvider>(
    GenderProvider(getIt<HttpService>()),
  );

  getIt.registerSingleton<NetworkProvider>(
    NetworkProvider(),
  );

  getIt.registerSingleton<PreferencesProvider>(PreferencesProvider());

  // final preferencesProvider = getIt<PreferencesProvider>();

  // getIt.registerSingleton<UserProvider>(UserProvider(
  //   preferencesProvider,
  // ));

  getIt.registerSingleton<ProductsProvider>(
    ProductsProvider(getIt<HttpService>()),
  );
}
