import 'package:astrology/utils/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _code = "";

  _registerSmsListener() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void initState() {
    // _registerSmsListener();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // request for otp code
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Verify",
      ),
      body: Column(
        children: [
          PinFieldAutoFill(
            codeLength: 4,
            decoration: UnderlineDecoration(
              textStyle: const TextStyle(fontSize: 20, color: Colors.black),
              // colorBuilder: FixedColorBuilder(
              //   Colors.black.withOpacity(0.3),
              // ),
              colorBuilder: PinListenColorBuilder(Colors.black, Colors.grey),
            ),
            currentCode: _code,
            onCodeSubmitted: (code) {},
            onCodeChanged: (code) {
              if (code!.length == 4) {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }
}
