import 'package:astrology/models/user/country.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryWidget extends StatefulWidget {
  const CountryWidget({super.key});

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  void initState() {
    Provider.of<CountryProvider>(context, listen: false).fetchCountryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    return countryProvider.countryList == null
        ? Container(
            margin: const EdgeInsets.only(right: 24),
            height: 24,
            width: 24,
            child: const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorUtil.colorDarkBlue),
            ),
          )
        : DropdownButton<Country>(
            value: countryProvider.selectedCountry,
            isExpanded: false,
            // isDense: true,
            items: countryProvider.countryList!.map((Country value) {
              return DropdownMenuItem<Country>(
                value: value,
                child: Center(
                  child: Text(
                    "${value.countryCode}",
                    style: StyleUtil.style16BlackBold,
                  ),
                ),
              );
            }).toList(),
            elevation: 4,
            iconEnabledColor: Colors.blue,
            underline: Container(),
            onChanged: (Country? newValue) {
              countryProvider.updateSelectedCountry(newValue!);
            },
          );
  }
}
