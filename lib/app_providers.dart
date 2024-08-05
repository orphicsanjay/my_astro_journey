import 'package:astrology/locator.dart';
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
import 'package:astrology/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => getIt<AppServicesProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AstrologerProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<BannerProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<BlogsProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<CountryProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<DistrictProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<GenderProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<NetworkProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PreferencesProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<ProductsProvider>()),
  ChangeNotifierProvider<UserProvider>(
    create: (context) {
      final preferencesProvider = Provider.of<PreferencesProvider>(context);
      return UserProvider(preferencesProvider);
    },
  ),
];
