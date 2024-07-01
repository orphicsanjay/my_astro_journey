import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppbar({super.key, this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight, // Set the height of the AppBar
      title: Center(child: Text('$title')),
      leading: leading,
      actions: actions,
      backgroundColor:
          const Color(0XFFFAFFFA), // Customize the background color
      elevation: 4, // Customize the shadow/elevation
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
