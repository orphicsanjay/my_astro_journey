import 'package:nepali_date_picker/nepali_date_picker.dart';

DateTime nepaliToEnglish(NepaliDateTime nepaliDate) {
  return nepaliDate.toDateTime();
}

NepaliDateTime englishToNepali(DateTime englishDate) {
  return englishDate.toNepaliDateTime();
}
