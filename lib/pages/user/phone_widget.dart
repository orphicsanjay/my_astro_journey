import 'package:astrology/models/user/country.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneWidget extends StatefulWidget {
  final ValueChanged<Country> onCountryChanged;
  final ValueChanged<String> onChanged;
  const PhoneWidget(
      {super.key, required this.onChanged, required this.onCountryChanged});

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  @override
  void initState() {
    Provider.of<CountryProvider>(context, listen: false).fetchCountryList();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<CountryProvider>(context, listen: false).fetchCountryList();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
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
          countryProvider.countryList == null
              ? Container(
                  margin: const EdgeInsets.only(right: 24),
                  height: 16,
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
                  padding: EdgeInsets.zero,
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
                    widget.onCountryChanged(newValue!);
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
                onChanged: widget.onChanged,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
  }
}
