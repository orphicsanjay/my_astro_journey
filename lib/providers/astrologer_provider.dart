import 'package:flutter/foundation.dart';

class AstrologerProvider with ChangeNotifier {
  final List<String> _astrologerList = [
    "Career",
    "Online",
    "English",
    "High to Low",
    "Low to High"
  ];
  List<String> get astrologerList => _astrologerList;
}
