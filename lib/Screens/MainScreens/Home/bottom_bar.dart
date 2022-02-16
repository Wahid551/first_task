import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int? badgeCount;
  final Function()? onTap;
  final String? imagePath;

  const BottomBar({
    this.badgeCount = 0,
    this.imagePath,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return widget.badgeCount! > 0
        ? Badge(
            position: BadgePosition.topEnd(top: -14),
            badgeContent: Text(
              widget.badgeCount.toString(),
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            badgeColor: Color(0xFFF9C311),
            child: GestureDetector(
              onTap: widget.onTap,
              child: Image.asset(
                widget.imagePath!,
                height: 24.5,
              ),
            ),
          )
        : GestureDetector(
            onTap: widget.onTap,
            child: Image.asset(
              widget.imagePath!,
              height: 24.5,
            ),
          );
  }
}
