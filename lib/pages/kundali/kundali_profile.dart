import 'dart:io';

import 'package:astrology/address/country.dart';
import 'package:astrology/models/user/gender.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/kundali/kundali_date_widget.dart';
import 'package:astrology/pages/kundali/kundali_gender_widget.dart';
import 'package:astrology/pages/user/custom_textformfield.dart';
import 'package:astrology/pages/user/phone_widget.dart';
import 'package:astrology/pages/user/profile_image_widget.dart';
import 'package:astrology/providers/gender_provider.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/profile_form_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class KundaliProfile extends StatefulWidget {
  const KundaliProfile({super.key});

  @override
  State<KundaliProfile> createState() => _KundaliProfileState();
}

class _KundaliProfileState extends State<KundaliProfile> {
  File? image;
  Gender? selectedGender;
  String selectedName = "";
  Country? selectedCountry;
  String selectedPhoneNumber = "";
  String selectedEmail = "";
  String selectedAddress = "";
  String englishBirthDate = "";
  String nepaliBirthDate = "";
  String birthTime = "";

  handleImageChange(File value) {
    image = value;
    setState(() {});
  }

  void handleNameChange(String value) {
    selectedName = value;
    setState(() {});
  }

  void handleGenderChange(Gender? value) {
    setState(() {
      selectedGender = value;
    });
  }

  void handleCountryChange(Country value) {
    selectedCountry = value;
    setState(() {});
  }

  void handlePhoneNumberChange(String value) {
    selectedPhoneNumber = value;
    setState(() {});
  }

  void handleEmailChange(String value) {
    selectedEmail = value;
    setState(() {});
  }

  void handleAddressChange(String value) {
    selectedAddress = value;
    setState(() {});
  }

  void handleBirthDateChanged(String englishDate, String nepaliDate) {
    englishBirthDate = englishDate;
    nepaliBirthDate = nepaliDate;
    setState(() {});
  }

  void handleBirthTimeChanged(String value) {
    birthTime = value;
    setState(() {});
  }

  void handleSave() {}

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GenderProvider>(context, listen: false).fetchGenderList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final genderProvider = Provider.of<GenderProvider>(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppbar(
                showBackButton: false,
                title: "",
              ),
              const Text(
                "Complete your profile",
                textAlign: TextAlign.center,
                style: StyleUtil.style20DarkBlueBold,
              ),
              ProfileImageWidget(
                image: image,
                onImagePicked: handleImageChange,
              ),
              const ProfileFormSpacer(),
              CustomTextFormField(
                labelText: "Name",
                hintText: "Enter name",
                validatorMessage: "Provide name",
                keyboardType: TextInputType.text,
                onChanged: handleNameChange,
              ),
              const ProfileFormSpacer(),
              SizedBox(
                width: size.width,
                child: const Text(
                  "Gender",
                  textAlign: TextAlign.start,
                  style: StyleUtil.style16DeepPurpleBold,
                ),
              ),
              genderProvider.genderList.isEmpty
                  ? const SizedBox()
                  : KundaliGenderWidget(
                      genderList: genderProvider.genderList,
                      selectedGender: selectedGender,
                      onGenderChanged: handleGenderChange,
                    ),
              const ProfileFormSpacer(),
              KundaliDateWidget(
                onDateChanged: handleBirthDateChanged,
                onTimeChanged: handleBirthTimeChanged,
              ),
              CustomTextFormField(
                labelText: "Email",
                hintText: "Enter email",
                validatorMessage: "Provide your email",
                keyboardType: TextInputType.emailAddress,
                onChanged: handlePhoneNumberChange,
              ),
              const ProfileFormSpacer(),
              PhoneWidget(
                  onChanged: handlePhoneNumberChange,
                  onCountryChanged: handleCountryChange),
              const ProfileFormSpacer(),
              CustomTextFormField(
                labelText: "Address",
                hintText: "Enter address",
                validatorMessage: "Provide address",
                keyboardType: TextInputType.text,
                onChanged: handleAddressChange,
              ),
              const CustomVerticalSpacer(height: 72),
              CustomButton(
                onTap: handleSave,
                title: "Save",
              ),
              const ProfileFormSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}
