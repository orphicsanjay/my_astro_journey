// ignore_for_file: avoid_unnecessary_containers

// import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/pages/auth/banner_image.dart';
import 'package:astrology/pages/auth/country_widget.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/otp_verify_page.dart';
import 'package:astrology/pages/auth/quote_widget.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_spacer.dart';
import 'package:astrology/utils/snackbar_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPhoneNumberSelected = true;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  updateTabSelection(bool value) {
    isPhoneNumberSelected = value;
    setState(() {});
  }

  handleLogin() {
    if (isPhoneNumberSelected) {
      if (phoneNumberController.text.isEmpty) {
        SnackbarUtils.showSnackbar(context, 'Provided your phone number');
        return;
      }
      if (phoneNumberController.text.length != 10) {
        SnackbarUtils.showSnackbar(
            context, 'Phone number should be exactly 10 digit');
        return;
      }
    } else {
      if (emailController.text.isEmpty) {
        SnackbarUtils.showSnackbar(context, 'Provided your email');
        return;
      }
    }

    RequestOTP requestOTP = RequestOTP(
        phonenumber: phoneNumberController.text,
        email: emailController.text,
        countryCode: Provider.of<CountryProvider>(context, listen: false)
            .selectedCountry!
            .id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPVerifyPage(
          isPhoneNumberSelected: isPhoneNumberSelected,
          requestOTP: requestOTP,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height.h,
        width: size.width.w,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BannerImage(height: size.height * 0.4),
              const QuoteWidget(),
              CustomSpacer(height: size.height * 0.1),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorUtil.colorLightBlue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                updateTabSelection(true);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 24.0),
                                decoration: BoxDecoration(
                                  color: isPhoneNumberSelected
                                      ? ColorUtil.colorLightBlue
                                      : ColorUtil.colorWhite,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "Phone Number",
                                    style: isPhoneNumberSelected
                                        ? StyleUtil.style16DeepPurpleBold
                                        : StyleUtil.style16DeepPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                updateTabSelection(false);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 24),
                                decoration: BoxDecoration(
                                  color: isPhoneNumberSelected
                                      ? ColorUtil.colorWhite
                                      : ColorUtil.colorLightBlue,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                    child: Text(
                                  "Email",
                                  style: isPhoneNumberSelected
                                      ? StyleUtil.style16DeepPurple
                                      : StyleUtil.style16DeepPurpleBold,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSpacer(),
                    isPhoneNumberSelected
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                  color: ColorUtil.colorLightBlue, width: 2.0),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CountryWidget(),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: ColorUtil.colorLightBlue,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: phoneNumberController,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 24),
                                        border: InputBorder.none,
                                        hintText: "Enter your phone number",
                                        hintStyle: StyleUtil.style16Grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 24),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Ensure the radius matches the default border
                                    borderSide: const BorderSide(
                                        color: ColorUtil.colorLightBlue,
                                        width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: ColorUtil.colorLightBlue,
                                        width: 1.0),
                                  ),
                                  hintText: "Enter your email"),
                            ),
                          ),
                    const CustomSpacer(),
                    CustomButton(
                      title: "Log In",
                      onTap: () {
                        handleLogin();
                      },
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
