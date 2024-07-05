import 'package:astrology/models/otp/otp_response.dart';
import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/models/user/access_token.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/otp_verified_page.dart';
import 'package:astrology/pages/auth/timer_widget.dart';
import 'package:astrology/providers/auth_provider.dart';
import 'package:astrology/providers/preferences_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/snackbar_util.dart';
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
  Map<String, dynamic> data = {};

  updateOTPCode(String value) {
    otpCode = value;
    setState(() {});
  }

  handleVerifyOTP() {
    if (otpCode.isEmpty) {
      SnackbarUtils.showSnackbar(context, "Provide otp for verification");
      return;
    }
    if (otpCode.length != 6) {
      SnackbarUtils.showSnackbar(context, "Provide full otp");
      return;
    }
    Map<String, dynamic>? map = {};
    if (widget.isPhoneNumberSelected) {
      map['phonenumber'] = "${widget.requestOTP.phonenumber}";
      map['otp_code'] = otpCode;
    } else {
      map['email'] = "${widget.requestOTP.email}";
      map['otp_code'] = otpCode;
    }
    Provider.of<AuthProvider>(context, listen: false)
        .verifyOTP(map)
        .then((OTPResponse? otpResponse) {
      if (otpResponse!.accessToken == null) {
        SnackbarUtils.showSnackbar(context, otpResponse.message!);
        return;
      }
      AccessToken accessToken =
          AccessToken(otpResponse.accessToken, otpResponse.refreshToken);
      Provider.of<PreferencesProvider>(context, listen: false)
          .saveAccessToken(accessToken);
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
      Provider.of<AuthProvider>(context, listen: false).requestOTP(data);
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
                    const CustomVerticalSpacer(height: 80),
                    Text(
                      widget.isPhoneNumberSelected
                          ? "Enter 4 digit verification code\n sent to your mobile number"
                          : "Enter 4 digit verification code\n sent to your email",
                      style: StyleUtil.style16DarkBlueBold,
                    ),
                    const CustomVerticalSpacer(height: 80),
                    PinFieldAutoFill(
                      // controller: otpController,
                      codeLength: 6,
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
                    const CustomVerticalSpacer(),
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
                    const CustomVerticalSpacer(),
                    const CustomVerticalSpacer(),
                    CustomButton(
                      title: "Confirm",
                      onTap: () {
                        handleVerifyOTP();
                      },
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
