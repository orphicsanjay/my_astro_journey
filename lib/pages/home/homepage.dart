import 'package:astrology/pages/home/home_widget.dart';
import 'package:astrology/utils/color_util.dart';
import 'package:astrology/utils/custom_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> bodyWidgets = [
    HomeWidget(),
    Container(),
    Container(),
    Container(),
  ];

  int selectedIndex = 0;

  void onIndexChanged(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: IndexedStack(
          index: selectedIndex,
          children: bodyWidgets,
        ),
        // child: SingleChildScrollView(
        //   physics: const ScrollPhysics(),
        //   child: bodyWidgets[selectedIndex],
        // ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(0, "assets/images/home_active.png",
                "assets/images/home_inactive.png"),
            _buildIcon(1, "assets/images/astrologer_active.png",
                "assets/images/astrologer_inactive.png"),
            _buildIcon(2, "assets/images/shop_active.png",
                "assets/images/shop_inactive.png"),
            _buildIcon(3, "assets/images/menu_active.png",
                "assets/images/menu_inactive.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index, String activeImage, String inactiveImage) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => onIndexChanged(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                selectedIndex == index ? activeImage : inactiveImage,
                width: 24,
                height: 24,
              ),
            ),
            const CustomVerticalSpacer(height: 8),
            if (selectedIndex == index)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                width: double.infinity,
                color: ColorUtil.colorOrange,
              ),
          ],
        ),
      ),
    );
  }
}
