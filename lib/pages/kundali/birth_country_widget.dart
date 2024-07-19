import 'package:astrology/providers/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirthCountryWidget extends StatefulWidget {
  const BirthCountryWidget({super.key});

  @override
  State<BirthCountryWidget> createState() => _BirthCountryWidgetState();
}

class _BirthCountryWidgetState extends State<BirthCountryWidget> {
  @override
  void initState() {
    Provider.of<CountryProvider>(context, listen: false).fetchCountryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
