import 'package:badges/badges.dart';
import 'package:first_task/constants/widgets.dart';
import 'package:flutter/material.dart';

import '../Screens/notification.dart';

class BottomNavigationBarr extends StatefulWidget {
  const BottomNavigationBarr({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarrState createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        // color: Colors.transparent,
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          color: Color(0xFF2E2E2E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/icons/calender.png',
                height: 24.5,
              ),
            ),
            lineBorder(),
            badge('5', 'assets/icons/np_new-project_643613_000000@3x.png'),
            lineBorder(),
            Badge(
              // borderRadius: BorderRadius.circular(5),
              position: BadgePosition.topEnd(top: -14),
              // alignment: Alignment.topRight,

              badgeContent: Text(
                '5',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              badgeColor: Color(0xFFF9C311),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.chat,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
            lineBorder(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => NotificationPage()),
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/path@3x.png',
                height: 24.5,
              ),
            ),
            lineBorder(),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/icons/np_more_2680300_000000@3x.png',
                height: 5.78,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
