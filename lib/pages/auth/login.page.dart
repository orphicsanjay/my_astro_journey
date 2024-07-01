// ignore_for_file: avoid_unnecessary_containers

// import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPhoneNumberSelected = true;
  String _selectedValue = "NP";

  _updateTabSelection(bool value) {
    _isPhoneNumberSelected = value;
    setState(() {});
  }

  _updateCountryCode(String value) {
    _selectedValue = value;
    setState(() {});
  }

  handleLogin() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: Image.asset("assets/images/login_astro_logo.png"),
              ),
              const CustomSpacer(),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      // margin: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorUtil.colorOrange,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _updateTabSelection(true);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 24.0),
                                decoration: BoxDecoration(
                                  color: _isPhoneNumberSelected
                                      ? ColorUtil.colorOrange
                                      : ColorUtil.colorWhite,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "Phone Number",
                                    style: _isPhoneNumberSelected
                                        ? StyleUtil.style16White
                                        : StyleUtil.style16Black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _updateTabSelection(false);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 24),
                                decoration: BoxDecoration(
                                  color: _isPhoneNumberSelected
                                      ? ColorUtil.colorWhite
                                      : ColorUtil.colorOrange,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Center(
                                    child: Text(
                                  "Email",
                                  style: _isPhoneNumberSelected
                                      ? StyleUtil.style16Black
                                      : StyleUtil.style16White,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSpacer(),
                    _isPhoneNumberSelected
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Ensure the radius matches the default border
                              border: Border.all(
                                  color: ColorUtil.colorGrey, width: 1.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DropdownButton<String>(
                                  value: _selectedValue,
                                  isExpanded: false,
                                  isDense: true,
                                  padding: EdgeInsets.zero,
                                  items: <String>['NP', 'IN', 'CAN', 'USA']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: Text(
                                          value,
                                          style: StyleUtil.style16BlackBold,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  elevation: 0,
                                  iconEnabledColor: Colors.transparent,
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    _updateCountryCode(newValue!);
                                  },
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: ColorUtil.colorGrey,
                                            width: 2),
                                      ),
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 24),
                                          border: InputBorder.none,
                                          hintText: "Enter your phone number"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Ensure the radius matches the default border
                                    borderSide: const BorderSide(
                                        color: ColorUtil.colorGrey, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: ColorUtil.colorGrey, width: 1.0),
                                  ),
                                  hintText: "Enter your email"),
                            ),
                          ),
                    const CustomSpacer(),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: ColorUtil.colorDarkBlue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Log In',
                          style: StyleUtil.style20White,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
