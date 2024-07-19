import 'package:astrology/providers/district_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirthCityWidget extends StatefulWidget {
  const BirthCityWidget({super.key});

  @override
  State<BirthCityWidget> createState() => _BirthCityWidgetState();
}

class _BirthCityWidgetState extends State<BirthCityWidget> {
  @override
  void initState() {
    Provider.of<DistrictProvider>(context, listen: false).fetchDistrictList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
