import 'package:astrology/bloc/address/address_bloc.dart';
import 'package:astrology/bloc/address/address_event.dart';
import 'package:astrology/bloc/address/address_state.dart';
import 'package:astrology/locator.dart';
import 'package:astrology/models/address/country.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/small_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryWidget extends StatefulWidget {
  const CountryWidget({super.key});

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  @override
  void initState() {
    getIt<AddressBloc>().add(FetchCountries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressBloc, AddressState>(
      listener: (context, state) {},
      bloc: getIt<AddressBloc>(),
      builder: (context, state) {
        if (state.isLoadingCountries) {
          return Container(
            margin: const EdgeInsets.only(right: 40),
            height: 16,
            width: 16,
            child: const SmallCircularProgess(),
          );
        }

        if (state.countries == null || state.countries!.isEmpty) {
          return Container(
            margin: const EdgeInsets.only(right: 40),
            height: 16,
            width: 16,
            child: const SizedBox(),
          );
        }

        return DropdownButton<Country>(
          value: state.selectedCountry,
          isExpanded: false,
          padding: EdgeInsets.zero,
          items: state.countries!.map((Country value) {
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
            getIt<AddressBloc>().add(UpdateSelectedCountry(newValue!));
          },
        );
      },
    );
  }
}
