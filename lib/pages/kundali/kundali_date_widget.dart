import 'package:astrology/utils/ad_bs_converter.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/profile_form_spacer.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class KundaliDateWidget extends StatefulWidget {
  final Function(String, String) onDateChanged;
  final ValueChanged<String> onTimeChanged;
  const KundaliDateWidget(
      {super.key, required this.onDateChanged, required this.onTimeChanged});

  @override
  State<KundaliDateWidget> createState() => _KundaliDateWidgetState();
}

class _KundaliDateWidgetState extends State<KundaliDateWidget> {
  String? selectedEnglishDate;
  String? selectedNepaliDate;
  String? selectedTime;

  void handleBirthDateChanged(String englishDate, String nepaliDate) {
    selectedEnglishDate = englishDate;
    selectedNepaliDate = nepaliDate;
    setState(() {});
    widget.onDateChanged(englishDate, nepaliDate);
  }

  void handleBirthTimeChanged(String value) {
    selectedTime = value;
    setState(() {});
    widget.onTimeChanged(selectedTime.toString());
  }

  Future<void> selectEnglishDate(BuildContext context) async {
    DateTime? englishDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Select a date',
    );

    if (englishDate != null) {
      final nepaliDate = englishToNepali(englishDate);
      handleBirthDateChanged(englishDate.toIso8601String().split('T').first,
          nepaliDate.toIso8601String().split('T').first);
    }
  }

  Future<void> selectNepaliDate(BuildContext context) async {
    final NepaliDateTime? nepaliDate = await showMaterialDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(1970, 2, 5),
      lastDate: NepaliDateTime(2250, 11, 6),
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select a date',
    );
    if (nepaliDate != null) {
      final englishDate = nepaliToEnglish(nepaliDate);
      handleBirthDateChanged(englishDate.toIso8601String().split('T').first,
          nepaliDate.toIso8601String().split('T').first);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Select time",
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );
    if (selectedTime != null) {
      handleBirthTimeChanged(selectedTime.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: ColorUtil.colorGrey, width: 1.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedEnglishDate ?? "Date of Birth (In English)",
                  style: selectedEnglishDate == null
                      ? StyleUtil.style14Grey
                      : StyleUtil.style14DarkBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectEnglishDate(context);
                },
                child: const Icon(
                  Icons.calendar_month,
                  color: ColorUtil.colorOrange,
                ),
              )
            ],
          ),
        ),
        const ProfileFormSpacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: ColorUtil.colorGrey, width: 1.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedNepaliDate ?? "Date of Birth (In Nepali)",
                  style: selectedNepaliDate == null
                      ? StyleUtil.style14Grey
                      : StyleUtil.style14DarkBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectNepaliDate(context);
                },
                child: const Icon(
                  Icons.calendar_month,
                  color: ColorUtil.colorOrange,
                ),
              )
            ],
          ),
        ),
        const ProfileFormSpacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: ColorUtil.colorGrey, width: 1.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedTime ?? "Time of Birth",
                  style: selectedTime == null
                      ? StyleUtil.style14Grey
                      : StyleUtil.style14DarkBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  selectTime(context);
                },
                child: const Icon(
                  Icons.watch_later_outlined,
                  color: ColorUtil.colorOrange,
                ),
              )
            ],
          ),
        ),
        const ProfileFormSpacer(),
      ],
    );
  }
}
