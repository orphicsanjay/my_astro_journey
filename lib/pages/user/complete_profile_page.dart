import 'dart:io';

import 'package:astrology/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_event.dart';
import 'package:astrology/bloc/complete_profile/complete_profile_state.dart';
import 'package:astrology/locator.dart';
import 'package:astrology/models/address/country.dart';
import 'package:astrology/models/user/gender.dart';
import 'package:astrology/pages/auth/custom_button.dart';
import 'package:astrology/pages/home/homepage.dart';
import 'package:astrology/pages/user/custom_textformfield.dart';
import 'package:astrology/pages/user/phone_widget.dart';
import 'package:astrology/pages/user/profile_image_widget.dart';
import 'package:astrology/providers/gender_provider.dart';
import 'package:astrology/utils/custom_appbar.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:astrology/utils/profile_form_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  File? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  // Gender? selectedGender;
  // String selectedName = "";
  Country? selectedCountry;
  String selectedPhoneNumber = "";
  // String selectedEmail = "";
  // String selectedAddress = "";

  handleImageChange(File value) {
    image = value;
    setState(() {});
  }

  // void handleNameChange(String value) {
  //   selectedName = value;
  //   setState(() {});
  // }

  void handleGenderChange(Gender? value) {
    // setState(() {
    //   selectedGender = value;
    // });
    getIt<CompleteProfileBloc>().add(UpdateGenders(value));
  }

  void handleCountryChange(Country value) {
    selectedCountry = value;
    setState(() {});
  }

  void handlePhoneNumberChange(String value) {
    selectedPhoneNumber = value;
    setState(() {});
  }

  // void handleEmailChange(String value) {
  //   selectedEmail = value;
  //   setState(() {});
  // }

  // void handleAddressChange(String value) {
  //   selectedAddress = value;
  //   setState(() {});
  // }

  void handleSave() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        // Do something when focus is lost
      }
    });
    super.initState();
    getIt<CompleteProfileBloc>().add(FetchGenders());
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding");
    final size = MediaQuery.of(context).size;
    // final genderProvider = Provider.of<GenderProvider>(context);
    return Scaffold(
      body: BlocBuilder<CompleteProfileBloc, CompleteProfileState>(
        bloc: getIt<CompleteProfileBloc>(),
        builder: (context, state) {
          return Container(
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
                    controller: nameController,

                    labelText: "Name",
                    hintText: "Enter name",
                    validatorMessage: "Provide name",
                    keyboardType: TextInputType.text,
                    // onChanged: handleNameChange,
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
                  state.genders!.isEmpty
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: state.genders!.map((Gender gender) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio<Gender>(
                                  value: gender,
                                  groupValue: state.selectedGender,
                                  onChanged: (Gender? value) {
                                    if (state.selectedGender
                                            .toString()
                                            .toLowerCase() ==
                                        value.toString().toLowerCase()) {
                                      return;
                                    }
                                    handleGenderChange(value);
                                  },
                                ),
                                Text(
                                  gender.value![0].toUpperCase() +
                                      gender.value!.substring(1).toLowerCase(),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                  const ProfileFormSpacer(),
                  CustomTextFormField(
                    controller: emailController,
                    labelText: "Email",
                    hintText: "Enter email",
                    validatorMessage: "Provide your email",
                    keyboardType: TextInputType.emailAddress,
                    // onChanged: handlePhoneNumberChange,
                  ),
                  const ProfileFormSpacer(),
                  PhoneWidget(
                    controller: phoneController,
                    // onChanged: handlePhoneNumberChange,
                    // onCountryChanged: handleCountryChange,
                  ),
                  const ProfileFormSpacer(),
                  CustomTextFormField(
                    controller: addressController,
                    labelText: "Address",
                    hintText: "Enter address",
                    validatorMessage: "Provide address",
                    keyboardType: TextInputType.text,
                    // onChanged: handleAddressChange,
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
          );
        },
        // listener: (context, state) {},
      ),
    );
  }
}
