import 'package:astrology/bloc/auth/auth_bloc.dart';
import 'package:astrology/bloc/auth/auth_event.dart';
import 'package:astrology/bloc/auth/auth_state.dart';
import 'package:astrology/locator.dart';
import 'package:astrology/models/otp/request_otp.dart';
import 'package:astrology/pages/auth/banner_image.dart';
import 'package:astrology/pages/auth/country_widget.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/auth/otp_verify_page.dart';
import 'package:astrology/pages/auth/quote_widget.dart';
import 'package:astrology/providers/country_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/snackbar_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  handleLogin(AuthState state) {
    if (state.currentIndex == 0) {
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
          isPhoneNumberSelected: state.currentIndex == 0 ? true : false,
          requestOTP: requestOTP,
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
        const AssetImage("assets/images/login_astro_logo.png"), context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: getIt<AuthBloc>(),
        listener: (BuildContext context, AuthState state) {},
        builder: (BuildContext context, AuthState state) {
          return SizedBox(
            height: size.height.h,
            width: size.width.w,
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BannerImage(height: size.height * 0.4),
                  const QuoteWidget(),
                  CustomVerticalSpacer(height: size.height * 0.1),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        _buildTabBar(state),
                        const CustomVerticalSpacer(),
                        IndexedStack(
                          index: state.currentIndex,
                          children: [
                            _buildPhoneNumberTab(),
                            _buildEmailTab(),
                          ],
                        ),
                        const CustomVerticalSpacer(),
                        const CustomVerticalSpacer(),
                        CustomButton(
                          title: "Log In",
                          onTap: () {
                            handleLogin(state);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabBar(AuthState state) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorUtil.colorLightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTabItem(
            label: "Phone Number",
            isSelected: state.currentIndex == 0,
            onTap: () {
              if (state.currentIndex == 0) return;
              getIt<AuthBloc>().add(ChangedTab(0));
            },
          ),
          _buildTabItem(
            label: "Email",
            isSelected: state.currentIndex == 1,
            onTap: () {
              if (state.currentIndex == 1) return;
              getIt<AuthBloc>().add(ChangedTab(1));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
          decoration: BoxDecoration(
            color: isSelected ? ColorUtil.colorLightBlue : ColorUtil.colorWhite,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              label,
              style: isSelected
                  ? StyleUtil.style16DeepPurpleBold
                  : StyleUtil.style16DeepPurple,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: ColorUtil.colorLightBlue, width: 2.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CountryWidget(),
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
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

  Widget _buildEmailTab() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: ColorUtil.colorLightBlue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: ColorUtil.colorLightBlue, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: ColorUtil.colorLightBlue, width: 2.0),
        ),
        hintText: "Enter your email",
      ),
    );
  }
}
