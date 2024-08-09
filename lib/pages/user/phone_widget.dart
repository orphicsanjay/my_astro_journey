import 'package:astrology/bloc/address/address_bloc.dart';
import 'package:astrology/bloc/address/address_event.dart';
import 'package:astrology/bloc/address/address_state.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_event.dart';
import 'package:astrology/locator.dart';
import 'package:astrology/models/address/country.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/small_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PhoneWidget extends StatefulWidget {
  // final ValueChanged<Country> onCountryChanged;
  // final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const PhoneWidget({super.key, required this.controller});

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  @override
  void initState() {
    getIt<AddressBloc>().add(FetchCountries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorUtil.colorGrey, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocConsumer<AddressBloc, AddressState>(
            listener: (context, state) {},
            bloc: getIt<AddressBloc>(),
            builder: (context, state) {
              print("isloadingcountries : ${state.isLoadingCountries}");
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
                  getIt<CompleteProfileBloc>().add(UpdateCountry(newValue));
                },
              );
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: ColorUtil.colorGrey,
                    width: 1,
                  ),
                ),
              ),
              child: TextFormField(
                // onChanged: widget.onChanged,
                controller: widget.controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                  border: InputBorder.none,
                  hintText: "Enter your phone number",
                  hintStyle: StyleUtil.style16Grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(12.0),
    //     border: Border.all(color: ColorUtil.colorGrey, width: 1.0),
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       countryProvider.countryList == null
    //           ? Container(
    //               margin: const EdgeInsets.only(right: 40),
    //               height: 16,
    //               width: 16,
    //               child: const CircularProgressIndicator(
    //                 valueColor:
    //                     AlwaysStoppedAnimation<Color>(ColorUtil.colorDarkBlue),
    //                 strokeWidth: 2.0,
    //               ),
    //             )
    //           : DropdownButton<Country>(
    //               value: countryProvider.selectedCountry,
    //               isExpanded: false,
    //               // isDense: true,
    //               padding: EdgeInsets.zero,
    //               items: countryProvider.countryList!.map((Country value) {
    //                 return DropdownMenuItem<Country>(
    //                   value: value,
    //                   child: Center(
    //                     child: Text(
    //                       "${value.countryCode}",
    //                       style: StyleUtil.style16BlackBold,
    //                     ),
    //                   ),
    //                 );
    //               }).toList(),
    //               elevation: 4,
    //               iconEnabledColor: Colors.blue,
    //               underline: Container(),
    //               onChanged: (Country? newValue) {
    //                 widget.onCountryChanged(newValue!);
    //               },
    //             ),
    //       Expanded(
    //         child: Container(
    //           padding: EdgeInsets.zero,
    //           decoration: const BoxDecoration(
    //             border: Border(
    //               left: BorderSide(
    //                 color: ColorUtil.colorGrey,
    //                 width: 1,
    //               ),
    //             ),
    //           ),
    //           child: TextFormField(
    //             onChanged: widget.onChanged,
    //             keyboardType: TextInputType.number,
    //             decoration: const InputDecoration(
    //               contentPadding:
    //                   EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
    //               border: InputBorder.none,
    //               hintText: "Enter your phone number",
    //               hintStyle: StyleUtil.style16Grey,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
