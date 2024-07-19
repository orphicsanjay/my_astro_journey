import 'package:astrology/models/user/gender.dart';
import 'package:flutter/material.dart';

class KundaliGenderWidget extends StatelessWidget {
  final List<Gender> genderList;
  final Gender? selectedGender;
  final ValueChanged<Gender> onGenderChanged;
  const KundaliGenderWidget(
      {super.key,
      required this.genderList,
      required this.selectedGender,
      required this.onGenderChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: genderList.map((Gender gender) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<Gender>(
              value: gender,
              groupValue: selectedGender,
              onChanged: (Gender? value) {
                onGenderChanged(value!);
              },
            ),
            Text(
              gender.value![0].toUpperCase() +
                  gender.value!.substring(1).toLowerCase(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
