// import 'package:flutter/foundation.dart';
// import 'http_provider.dart';

// class AnotherProvider with ChangeNotifier {
//   final HttpProvider httpProvider;

//   AnotherProvider(this.httpProvider);

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   updateIsLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }

//   // Example usage of HttpProvider within AnotherProvider
//   Future<void> performSomeAction() async {
//     updateIsLoading(true);
//     await httpProvider.fetchData('/some-endpoint');
//     // Do something with the fetched data
//     updateIsLoading(false);
//   }
// }
