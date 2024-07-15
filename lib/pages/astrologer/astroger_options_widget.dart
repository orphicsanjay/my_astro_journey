import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class AstrologerOptionsWidget extends StatelessWidget {
  final List<String> astrologerList;
  final ValueChanged<String> onTap;
  const AstrologerOptionsWidget(
      {super.key, required this.astrologerList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: astrologerList.map((item) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: InkWell(
              borderRadius: BorderRadius.circular(24), // Apply border radius
              onTap: () {
                onTap(item);
              },
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(item, style: StyleUtil.style12DeepPurple),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
