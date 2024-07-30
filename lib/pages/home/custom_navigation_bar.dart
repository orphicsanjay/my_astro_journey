// import 'package:flutter/material.dart';

// class CustomNavigationBar extends StatefulWidget {
//   final IconData activeIcon;
//   final IconData inActiveIcon;
//   const CustomNavigationBar({super.key});

//   @override
//   State<CustomNavigationBar> createState() => _CustomNavigationBarState();
// }

// class _CustomNavigationBarState extends State<CustomNavigationBar> {
//   int selectedIndex = 0;

//   void onIndexChanged(int index) {
//     selectedIndex = index;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onIndexChanged(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//               // icon,
//               // color: _selectedIndex == index ? Colors.amber[800] : Colors.grey,
//               ),
//           if (selectedIndex == index)
//             Container(
//               margin: const EdgeInsets.only(top: 4),
//               height: 2,
//               width: 24,
//               color: Colors.amber[800],
//             ),
//         ],
//       ),
//     );
//   }
// }
