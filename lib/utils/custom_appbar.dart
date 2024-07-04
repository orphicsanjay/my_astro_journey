import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;

  const CustomAppbar(
      {super.key,
      this.title,
      this.leading,
      this.actions,
      this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 72,
      toolbarHeight: kToolbarHeight,
      title: Text(
        '$title',
        style: StyleUtil.style20DarkBlueBold,
      ),
      leading: showBackButton
          ? Container(
              margin: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                color: ColorUtil.colorLightBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: ColorUtil.colorWhite,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          : const SizedBox(),
      actions: actions,
      backgroundColor: ColorUtil.colorWhite,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
