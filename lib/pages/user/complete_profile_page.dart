import 'dart:io';

import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/user/custom_textformfield.dart';
import 'package:astrology/pages/user/dob_widget.dart';
import 'package:astrology/pages/user/gender_widget.dart';
import 'package:astrology/pages/user/profile_image_widget.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_spacer.dart';
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
  String selectedDob = "";
  String selectedTimeOfBirth = "";
  String selectedBirthPlace = "";
  String selectedBirthCountry = "";
  String selectedPhoneNumber = "";

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

  void handleDobChange(String value) {
    selectedDob = value;
    setState(() {});
  }

  void handleTimeOfBirthChange(String value) {
    selectedTimeOfBirth = value;
    setState(() {});
  }

  void handleBirthPlaceChange(String value) {
    selectedBirthPlace = value;
    setState(() {});
  }

  void handleBirthCountryChange(String value) {
    selectedBirthCountry = value;
    setState(() {});
  }

  void handlePhoneNumberChange(String value) {
    selectedPhoneNumber = value;
    setState(() {});
  }

  void handleSave() {
    print("saved pressed");
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
              const CustomSpacer(),
              CustomTextFormField(
                labelText: "Name",
                hintText: "Enter name",
                validatorMessage: "Provide name",
                keyboardType: TextInputType.text,
                onChanged: handleNameChange,
              ),
              const CustomSpacer(),
              SizedBox(
                width: size.width,
                child: const Text(
                  "Gender",
                  textAlign: TextAlign.start,
                  style: StyleUtil.style16OrangeBold,
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
              const CustomSpacer(),
              DobWidget(
                onChanged: handleDobChange,
              ),
              const CustomSpacer(),
              CustomTextFormField(
                labelText: "Time of Birth",
                hintText: "Enter time of birth",
                validatorMessage: "Provide time of birth",
                keyboardType: TextInputType.number,
                onChanged: handleNameChange,
              ),
              const CustomSpacer(),
              CustomTextFormField(
                labelText: "Birth Place",
                hintText: "Enter birth place",
                validatorMessage: "Provide birth place",
                keyboardType: TextInputType.text,
                onChanged: handleBirthPlaceChange,
              ),
              const CustomSpacer(),
              CustomTextFormField(
                labelText: "Birth Country",
                hintText: "Enter birth country",
                validatorMessage: "Provide birth country",
                keyboardType: TextInputType.text,
                onChanged: handleBirthCountryChange,
              ),
              const CustomSpacer(),
              CustomTextFormField(
                labelText: "Phone Number",
                hintText: "Enter phone number",
                validatorMessage: "Provide phone number",
                keyboardType: TextInputType.number,
                onChanged: handlePhoneNumberChange,
              ),
              const CustomSpacer(height: 40),
              CustomButton(
                onTap: handleSave,
                title: "Save",
              ),
              const CustomSpacer(),
            ],
          ),
        ),
      ),
    );
  }
}
