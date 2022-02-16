import 'package:first_task/constants/widgets.dart';
import 'package:flutter/material.dart';
import '../Screens/MainScreens/Home/bottom_bar.dart';
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
            BottomBar(
              onTap: () {},
              imagePath: 'assets/icons/calender.png',
            ),
            lineBorder(),
            BottomBar(
              onTap: () {},
              imagePath: 'assets/icons/np_new-project_643613_000000@3x.png',
              badgeCount: 5,
            ),
            lineBorder(),
            BottomBar(
              onTap: () {},
              imagePath: 'assets/icons/np_new-project_643613_000000@3x.png',
              badgeCount: 6,
            ),
            lineBorder(),
            BottomBar(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => NotificationPage()),
                  ),
                );
              },
              imagePath: 'assets/icons/path@3x.png',
            ),
            lineBorder(),
            BottomBar(
              onTap: () {},
              imagePath: 'assets/icons/np_more_2680300_000000@3x.png',
            ),
          ],
        ),
      ),
    );
  }
}
