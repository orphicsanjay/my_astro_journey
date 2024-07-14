import 'dart:io';

import 'package:astrology/models/user/country.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/home/homepage.dart';
import 'package:astrology/pages/user/custom_textformfield.dart';
import 'package:astrology/pages/user/gender_widget.dart';
import 'package:astrology/pages/user/phone_widget.dart';
import 'package:astrology/pages/user/profile_image_widget.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/profile_form_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  File? image;
  String? selectedGender;
  String selectedName = "";
  // String selectedDob = "";
  // String selectedTimeOfBirth = "";
  // String selectedBirthPlace = "";
  // String selectedBirthCountry = "";
  Country? selectedCountry;
  String selectedPhoneNumber = "";
  String selectedEmail = "";
  String selectedAddress = "";

  handleImageChange(File value) {
    image = value;
    setState(() {});
  }

  void handleNameChange(String value) {
    selectedName = value;
    setState(() {});
  }

  void handleGenderChange(String? value) {
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

  void handleSave() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GenderWidget(
                      title: "Male",
                      value: "Male",
                      groupValue: selectedGender,
                      onChanged: handleGenderChange,
                    ),
                  ),
                  Expanded(
                    child: GenderWidget(
                      title: "Female",
                      value: "Female",
                      groupValue: selectedGender,
                      onChanged: handleGenderChange,
                    ),
                  ),
                  Expanded(
                    child: GenderWidget(
                      title: "Others",
                      value: "Others",
                      groupValue: selectedGender,
                      onChanged: handleGenderChange,
                    ),
                  ),
                ],
              ),
              const ProfileFormSpacer(),
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


  // void handleDobChange(String value) {
  //   selectedDob = value;
  //   setState(() {});
  // }

  // void handleTimeOfBirthChange(String value) {
  //   selectedTimeOfBirth = value;
  //   setState(() {});
  // }

  // void handleBirthPlaceChange(String value) {
  //   selectedBirthPlace = value;
  //   setState(() {});
  // }

  // void handleBirthCountryChange(String value) {
  //   selectedBirthCountry = value;
  //   setState(() {});
  // }


// DobWidget(onChanged: handleDobChange),
              // const ProfileFormSpacer(),
              // TimeWidget(onChanged: handleTimeOfBirthChange),
              // const ProfileFormSpacer(),
              // CustomTextFormField(
              //   labelText: "Birth Country",
              //   hintText: "Enter birth country",
              //   validatorMessage: "Provide birth country",
              //   keyboardType: TextInputType.text,
              //   onChanged: handleBirthCountryChange,
              // ),
              // const ProfileFormSpacer(),
              // CustomTextFormField(
              //   labelText: "Birth Place",
              //   hintText: "Enter birth place",
              //   validatorMessage: "Provide birth place",
              //   keyboardType: TextInputType.text,
              //   onChanged: handleBirthPlaceChange,
              // ),
              // const ProfileFormSpacer(),