import 'package:astrology/pages/user/complete_profile_page.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class OTPVerifiedPage extends StatefulWidget {
  final bool isPhoneNumber;
  const OTPVerifiedPage({super.key, required this.isPhoneNumber});

  @override
  State<OTPVerifiedPage> createState() => _OTPVerifiedPageState();
}

class _OTPVerifiedPageState extends State<OTPVerifiedPage> {
  navigateToCompleteProfile() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const CompleteProfilePage(),
        ),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  void initState() {
    // navigateToCompleteProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: ColorUtil.colorLightOrange,
                ),
                child: ClipOval(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorUtil.colorOrange,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: ColorUtil.colorWhite,
                        size: 32.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const CustomVerticalSpacer(height: 24.0),
            Text(
              widget.isPhoneNumber ? "Phone number verified" : "Email verified",
              style: StyleUtil.style16BlackBold,
            ),
            const CustomVerticalSpacer(height: 16.0),
            const Text(
              "You will be redirected to the main page\n in few minutes",
              textAlign: TextAlign.center,
              style: StyleUtil.style16Black,
            ),
          ],
        ),
      ),
    );
  }
}
