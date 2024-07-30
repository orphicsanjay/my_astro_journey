// import 'package:astrology/address/district.dart';
// import 'package:astrology/utils/color_util.dart';
// import 'package:astrology/utils/style_utl.dart';
// import 'package:flutter/material.dart';

// class BirthPlaceWidget extends StatelessWidget {
//   final List<District>? districtList;
//   final ValueChanged<District>? onDistrictSelected;
//   const BirthPlaceWidget(
//       {super.key, required this.districtList, this.onDistrictSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         border: Border.all(color: ColorUtil.colorGrey, width: 1.0),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: IgnorePointer(
//               ignoring: districtList == null,
//               child: Autocomplete<District>(
//                 optionsBuilder: (TextEditingValue textEditingValue) {
//                   if (textEditingValue.text.isEmpty) {
//                     return const Iterable<District>.empty();
//                   }
//                   return districtList!.where((District option) {
//                     return option.name!
//                         .toLowerCase()
//                         .contains(textEditingValue.text.toLowerCase());
//                   });
//                 },
//                 displayStringForOption: (District option) => option.name ?? '',
//                 onSelected: (District selection) {
//                   if (onDistrictSelected != null) {
//                     onDistrictSelected!(selection); // Invoke the callback
//                   }
//                 },
//                 fieldViewBuilder: (BuildContext context,
//                     TextEditingController textEditingController,
//                     FocusNode focusNode,
//                     VoidCallback onFieldSubmitted) {
//                   return TextField(
//                     controller: textEditingController,
//                     focusNode: focusNode,
//                     style: StyleUtil.style14DarkBlue,
//                     onSubmitted: (String value) {
//                       onFieldSubmitted();
//                     },
//                     decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.zero,
//                       hintText: 'Birth City',
//                       hintStyle: StyleUtil.style14Grey,
//                       border: InputBorder.none,
//                     ),
//                   );
//                 },
//                 optionsViewBuilder: (BuildContext context,
//                     AutocompleteOnSelected<District> onSelected,
//                     Iterable<District> options) {
//                   return Align(
//                     alignment: Alignment.topLeft,
//                     child: Material(
//                       elevation: 4.0,
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width - 62,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: options.map((District option) {
//                               return InkWell(
//                                 onTap: () {
//                                   onSelected(option);
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: Text(
//                                     option.name ?? '',
//                                     textAlign: TextAlign.start,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           districtList == null
//               ? const SizedBox(
//                   height: 16,
//                   width: 16,
//                   child: CircularProgressIndicator(
//                     valueColor:
//                         AlwaysStoppedAnimation<Color>(ColorUtil.colorDarkBlue),
//                     strokeWidth: 2.0,
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
