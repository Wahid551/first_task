import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_task/Screens/notification.dart';
// import 'package:first_task/Screens/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:badges/badges.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<Widget> imageSliders = [];
  int _current = 0;
  void listItems() {
    Size size = MediaQuery.of(context).size;
    imageSliders = imgList
        .map((item) => Container(
              child: ClipRRect(
                  // borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                children: <Widget>[
                  Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: size.width * 20,
                    height: size.height * 10,
                  ),
                  Positioned(
                      left: 20.0,
                      top: 24.0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/icons/icons-light-close@3x.png',
                          height: 24,
                        ),
                      )),
                  Positioned(
                    left: 0.0,
                    top: 24.0,
                    right: 20.0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        'assets/icons/icons-light-setting@3x.png',
                        height: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145.0,
                    bottom: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color(0xFFFFFFFF)
                                  : Color.fromARGB(186, 216, 218, 208)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    listItems();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      bottomSheet: Container(
        // color: Colors.red,
        // width: double.infinity,
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0,
            ),
          ],
        ),
        height: 239,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          elevation: 20.0,
          shadowColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      'https://googleflutter.com/sample_image.jpg',
                      // width: 100,
                      height: 70,
                      width: 65,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'John’s Doe',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C5264)),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.sp,
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C5264)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.7),
                          child: Icon(
                            Icons.star,
                            color: Color(0xFFFFB900),
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xFF4C5264),
                  thickness: 0.05,
                ),
                // ListTile(
                //   leading: Text(
                //     'TIMER',
                //     style: TextStyle(
                //       color: Color(0xFF4C5264),
                //       fontSize: 22.0,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   title: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       '00:10:24',
                //       style: TextStyle(
                //         color: Color(0xFFF98411),
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                //   trailing: Container(
                //     width: 50,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Icon(
                //       Icons.pause,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Get your gear setup & ready to work.',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        color: Color(0xFF4C5264),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10.0,
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Container(
                    width: 305,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFF2E2E2E),
                      borderRadius: BorderRadius.circular(52),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    // width: size.width*50,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 1,
                        // enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: imageSliders,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 6.0, top: 10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lawn Mowing',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 22.0,
                              color: Color(0xFF43A236),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Small Grass - 3 hours',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              color: Color(0xFF4C5264),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ico.svg',
                              color: Color(0xFF43A236),
                              height: 15.51,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.49),
                              child: Text(
                                'Today 5th March 2019, 07:30 AM',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF4C5264),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 41,
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Recurring, Every 2 weeks',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                color: Color(0xFF4C5264),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/path.svg',
                              color: Color(0xFF43A236),
                              height: 15.51,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 28.49),
                              child: Text(
                                '221B Baker Street',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF4C5264),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 41,
                            top: 0.0,
                            bottom: 10.0,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Sector 28, Phase 2, New York, USA',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                color: Color(0xFF4C5264),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        // ListTile(
                        //   leading: Text('Wahid'),
                        //   minLeadingWidth: 15.51,
                        // ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Color(0xFF43A236),
                              size: 15.51,
                            ),
                            SizedBox(
                              width: 25.0,
                            ),
                            Expanded(
                              flex: 30,
                              child: Text(
                                'Lorem Ipsum is simply dummy, typesetting industry Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                // textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  // overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xFF4C5264),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300,
                                  // overflow: TextOverflow.ellipsis,
                                ),

                                // softWrap: true,
                                // textAlign: TextAlign.justify,
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 239,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
              SizedBox(
                height: 23.3,
                width: 2,
                child: Container(
                  // height:20,
                  color: Color(0xFF4C5264),
                ),
              ),
              Badge(
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
                  child: Image.asset(
                    'assets/icons/np_new-project_643613_000000@3x.png',
                    height: 24.5,
                  ),
                ),
              ),
              SizedBox(
                height: 23.3,
                width: 2,
                child: Container(
                  // height:20,
                  color: Color(0xFF4C5264),
                ),
              ),
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
              SizedBox(
                height: 23.3,
                width: 2,
                child: Container(
                  // height:20,
                  color: Color(0xFF4C5264),
                ),
              ),
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
              SizedBox(
                height: 23.3,
                width: 2,
                child: Container(
                  // height:20,
                  color: Color(0xFF4C5264),
                ),
              ),
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
      ),
    );
  }
}
