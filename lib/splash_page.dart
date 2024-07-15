import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/pages/astrologer/astrologer_detail_page.dart';
import 'package:astrology/pages/astrologer/astrologer_list_page.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/login.page.dart';
import 'package:astrology/pages/auth/otp_verify_page.dart';
import 'package:astrology/pages/home/homepage.dart';
import 'package:astrology/pages/user/complete_profile_page.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  handleOnTap(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(title: "", showBackButton: false),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  onTap: () {
                    handleOnTap(context, const LoginPage());
                  },
                  title: "Login Page"),
              const CustomVerticalSpacer(),
              CustomButton(
                  onTap: () {
                    handleOnTap(context, const HomePage());
                  },
                  title: "Home Page"),
              const CustomVerticalSpacer(),
              CustomButton(
                  onTap: () {
                    handleOnTap(context, const CompleteProfilePage());
                  },
                  title: "Complete Profile"),
              const CustomVerticalSpacer(),
              CustomButton(
                  onTap: () {
                    RequestOTP requestOTP = RequestOTP(
                        phonenumber: "9847012345", email: "", countryCode: 1);
                    handleOnTap(
                      context,
                      OTPVerifyPage(
                          isPhoneNumberSelected: true, requestOTP: requestOTP),
                    );
                  },
                  title: "OTP Verify Page"),
              const CustomVerticalSpacer(),
              // CustomButton(onTap: () {}, title: "OTP Verified Page"),const CustomVerticalSpacer(),
              CustomButton(
                  onTap: () {
                    handleOnTap(context, const AstrologerListPage());
                  },
                  title: "Astrologers List Page"),
              const CustomVerticalSpacer(),
              CustomButton(
                  onTap: () {
                    handleOnTap(context, const AstrologerDetailPage());
                  },
                  title: "Astrologer Detail Page"),
              const CustomVerticalSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}


// home: const AstrologerDetailPage(),
        // home: const AstrologerListPage(),
        // home: const CompleteProfilePage(),
        // home: const LoginPage(),
        // home: const HomePage(),
        // home: const OTPVerifiedPage(
        //   isPhoneNumber: true,
        // ),