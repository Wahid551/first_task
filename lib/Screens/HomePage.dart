import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_task/Screens/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 15.0,
                    right: 250,
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  Positioned(
                    left: 250.0,
                    top: 15.0,
                    right: 0,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ],
              )),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    listItems();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      bottomSheet: Container(
        height: 250,
        child: Card(
          elevation: 10.0,
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                    // borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(
                      'https://googleflutter.com/sample_image.jpg',
                      height: 62.95,
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'John’s Doe',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C5264)),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C5264)),
                      )
                    ],
                  ),
                  trailing: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xFF4C5264),
                ),
                ListTile(
                  leading: Text(
                    'TIMER',
                    style: TextStyle(
                      color: Color(0xFF4C5264),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '00:10:24',
                      style: TextStyle(
                        color: Color(0xFFF98411),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  trailing: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Get your gear setup & ready to work.',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF4C5264),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.arrow_right_outlined,
                    size: 40.0,
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
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
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
                        ),
                        items: imageSliders,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 5.0, top: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lawn Mowing',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: Color(0xFF43A236),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Small Grass - 3 hours',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF4C5264),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          SingleItem(
                            icon: 'ico.svg',
                            title: 'Today 5th March 2019, 07:30 AM',
                            subTitle: 'Recurring, Every 2 weeks',
                          ),
                          SingleItem(
                            icon: 'path.svg',
                            title: '221B Baker Street',
                            subTitle: 'Sector 28, Phase 2, New York, USA',
                          ),
                          SingleItem(
                              icon: '',
                              title:
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              subTitle: ''),
                          SizedBox(
                            height: 250,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Color(0xFF2E2E2E),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.calendar_today_outlined,
            ),
            backgroundColor: Color(0xFF2E2E2E),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.new_label_outlined,
            ),
            backgroundColor: Color(0xFF2E2E2E),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
            ),
            backgroundColor: Color(0xFF2E2E2E),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.notifications_active_outlined,
            ),
            backgroundColor: Color(0xFF2E2E2E),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
            ),
            backgroundColor: Color(0xFF2E2E2E),
          ),
        ],
      ),
    );
  }
}
