import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

Widget lineBorder() {
  return SizedBox(
    height: 23.3,
    width: 2,
    child: Container(
      // height:20,
      color: Color(0xFF4C5264),
    ),
  );
}

Widget badge(String text, String img) {
  return Badge(
    position: BadgePosition.topEnd(top: -14),
    // alignment: Alignment.topRight,

    badgeContent: Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    ),
    badgeColor: Color(0xFFF9C311),
    child: GestureDetector(
      onTap: () {},
      child: Image.asset(
        img,
        height: 24.5,
      ),
    ),
  );
}
