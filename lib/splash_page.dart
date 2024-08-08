import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/pages/astro_shop/astro_shop_page.dart';
import 'package:astrology/pages/astrologer/astrologer_detail_page.dart';
import 'package:astrology/pages/astrologer/astrologer_list_page.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/login.page.dart';
import 'package:astrology/pages/auth/otp_verified_page.dart';
import 'package:astrology/pages/auth/otp_verify_page.dart';
import 'package:astrology/pages/home/homepage.dart';
import 'package:astrology/pages/kundali/kundali_profile.dart';
import 'package:astrology/pages/news/news_events_detail_page.dart';
import 'package:astrology/pages/news/news_events_page.dart';
import 'package:astrology/pages/rating_and_comment/rating_comment_sheet.dart';
import 'package:astrology/pages/user/complete_profile_page.dart';
import 'package:astrology/utils/color_util.dart';
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
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
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
                  handleOnTap(
                      context,
                      const OTPVerifiedPage(
                        isPhoneNumber: true,
                      ));
                },
                title: "OTP Verified Page"),
            const CustomVerticalSpacer(),
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
            CustomButton(
                onTap: () {
                  handleOnTap(context, const KundaliProfile());
                },
                title: "Kundali Profile"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  showRatingAndCommentSheet(context);
                },
                title: "Rating & Comment Option"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const NewsEventPage());
                },
                title: "News & Events"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const NewsEventDetailPage());
                },
                title: "News & Events Detail"),
            const CustomVerticalSpacer(),
            CustomButton(
                onTap: () {
                  handleOnTap(context, const AstroShopPage());
                },
                title: "Astro Shop"),
            const CustomVerticalSpacer(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   showRatingAndCommentSheet(context);
      // }),
    );
  }

  void showRatingAndCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorUtil.colorWhite,
      builder: (BuildContext context) {
        return const RatingCommentSheet();
      },
    );
  }
}
