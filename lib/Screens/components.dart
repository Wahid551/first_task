// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class SingleItem extends StatefulWidget {
//   String icon;
//   String title;
//   String subTitle;
//   SingleItem({required this.icon, required this.subTitle, required this.title});

//   @override
//   State<SingleItem> createState() => _SingleItemState();
// }

// class _SingleItemState extends State<SingleItem> {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: widget.icon != ''
//           ? SvgPicture.asset(
//               'assets/icons/${widget.icon}',
//               color: Color(0xFF43A236),
//               height: 15.51,
//             )
//           : Icon(
//               Icons.menu,
//               color: Color(0xFF43A236),
//               size: 22.0,
//             ),
//       title: Text(
//         widget.title,
//         style: TextStyle(
//           fontFamily: 'Montserrat',
//           color: Color(0xFF4C5264),
//           fontSize: 16.0,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       subtitle: Text(
//         widget.subTitle,
//         style: TextStyle(
//           fontFamily: 'Montserrat',
//           fontSize: 16.0,
//           color: Color(0xFF4C5264),
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }
