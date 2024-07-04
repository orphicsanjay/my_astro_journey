import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/otp_verified_page.dart';
import 'package:astrology/pages/auth/timer_widget.dart';
import 'package:astrology/providers/auth_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:astrology/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPVerifyPage extends StatefulWidget {
  final bool isPhoneNumberSelected;
  final RequestOTP requestOTP;

  const OTPVerifyPage(
      {super.key,
      required this.requestOTP,
      required this.isPhoneNumberSelected});

  @override
  State<OTPVerifyPage> createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  String otpCode = "";
  // TextEditingController otpController = TextEditingController();
  Map<String, dynamic> data = {};

  updateOTPCode(String value) {
    otpCode = value;
    setState(() {});
  }

  handleVerifyOTP() {
    Map<String, dynamic>? map = {};
    if (widget.isPhoneNumberSelected) {
      map['phonenumber'] = "${widget.requestOTP.phonenumber}";
      map['otp_code'] = otpCode;
    } else {
      map['phonenumber'] = "${widget.requestOTP.email}";
      map['otp_code'] = otpCode;
    }
    Provider.of<AuthProvider>(context, listen: false)
        .verifyOTP(map)
        .then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => OTPVerifiedPage(
                  isPhoneNumber: widget.isPhoneNumberSelected,
                )),
        (Route<dynamic> route) => false,
      );
    });
  }

  _registerSmsListener() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void initState() {
    // _registerSmsListener();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isPhoneNumberSelected) {
        data['phonenumber'] = "${widget.requestOTP.phonenumber}";
        data['country_code'] = "${widget.requestOTP.countryCode}";
      } else {
        data['email'] = "${widget.requestOTP.email}";
      }
      Provider.of<AuthProvider>(context, listen: false).requestOTP(data!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppbar(
        title: "OTP Verification",
      ),
      body: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    const CustomSpacer(height: 80),
                    Text(
                      widget.isPhoneNumberSelected
                          ? "Enter 4 digit verification code\n sent to your mobile number"
                          : "Enter 4 digit verification code\n sent to your email",
                      style: StyleUtil.style16DarkBlueBold,
                    ),
                    const CustomSpacer(height: 80),
                    PinFieldAutoFill(
                      // controller: otpController,
                      codeLength: 4,
                      decoration: UnderlineDecoration(
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        colorBuilder: PinListenColorBuilder(
                            ColorUtil.colorOrange, Colors.grey),
                      ),
                      currentCode: otpCode,
                      onCodeSubmitted: (code) {
                        return;
                      },
                      onCodeChanged: (code) {
                        updateOTPCode(code!);
                      },
                    ),
                    const CustomSpacer(),
                    TimerWidget(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPVerifyPage(
                                isPhoneNumberSelected:
                                    widget.isPhoneNumberSelected,
                                requestOTP: widget.requestOTP),
                          ),
                        );
                      },
                    ),
                    const CustomSpacer(),
                    const CustomSpacer(),
                    CustomButton(
                      title: "Confirm",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              authProvider.isVerifyingOtp
                  ? const LoadingWidget()
                  : const SizedBox(),
            ],
          )),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }
}
