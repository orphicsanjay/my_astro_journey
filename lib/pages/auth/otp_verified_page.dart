import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OTPVerifiedPage extends StatefulWidget {
  final bool isPhoneNumber;
  const OTPVerifiedPage({super.key, required this.isPhoneNumber});

  @override
  State<OTPVerifiedPage> createState() => _OTPVerifiedPageState();
}

class _OTPVerifiedPageState extends State<OTPVerifiedPage> {
  // navigateToCompleteProfile() {
  //   Navigator.of(context).pushAndRemoveUntil(
  //     MaterialPageRoute(
  //         builder: (context) => OTPVerifiedPage(
  //               isPhoneNumber: widget.isPhoneNumberSelected,
  //             )),
  //     (Route<dynamic> route) => false,
  //   );
  // }

  @override
  void initState() {
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
            const CustomSpacer(height: 24.0),
            Text(
              widget.isPhoneNumber ? "Phone number verified" : "Email verified",
              style: StyleUtil.style20BlackBold,
            ),
            const CustomSpacer(height: 16.0),
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
