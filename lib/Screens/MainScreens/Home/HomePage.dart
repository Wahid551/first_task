import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_task/constants/Colors.dart';
import 'package:first_task/constants/bottomNav.dart';
import 'package:first_task/constants/images-list.dart';
import 'package:first_task/constants/textstyle.dart';
import 'package:first_task/services/timer_provider.dart';
import 'package:first_task/model/model.dart';
import 'package:first_task/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> imageSliders = [];
  int _current = 0;
  bool isClicked = false;
  int min = 10;

  late Album futureData;
  late ApiServiceProvider _apiServiceProvider;
  late PeriodicTimerProvider _periodicTimerProvider;
  @override
  void initState() {
    // ApiServiceProvider _service = Provider.of(context, listen: false);
    // _service.getPosts();
    super.initState();
  }

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
                    // left: 145.0,
                    // bottom: 10.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
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
                  ),
                ],
              )),
            ))
        .toList();
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes =
        twoDigits(_periodicTimerProvider.duration.inMinutes.remainder(60));
    final seconds =
        twoDigits(_periodicTimerProvider.duration.inSeconds.remainder(60));
    final hours =
        twoDigits(_periodicTimerProvider.duration.inHours.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(0xFFF98411),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget buttonWidget() {
    final isRunning = _periodicTimerProvider.timer == null
        ? false
        : _periodicTimerProvider.timer!.isActive;
    return GestureDetector(
      onTap: () {
        if (isRunning) {
          _periodicTimerProvider.stopTimer(resets: false);
        } else {
          _periodicTimerProvider.timerIncreament(resets: false);
        }
      },
      child: Container(
        width: 39,
        height: 39,
        decoration: BoxDecoration(
          color: isRunning ? Colors.black : Colors.amber,
          shape: BoxShape.circle,
        ),
        child: isRunning
            ? Icon(
                Icons.pause,
                color: Colors.white,
              )
            : Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      _periodicTimerProvider = Provider.of(context);
      _apiServiceProvider = Provider.of(context);
      _apiServiceProvider.getPosts().then((value) {
        futureData = value;
      });
      listItems();
    } catch (error) {
      print('Error while getting data $error');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: _apiServiceProvider.isData == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              viewportFraction: 1,
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
                          padding: EdgeInsets.only(
                              left: 24.0, right: 6.0, top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lawn Mowing',
                                style: TextStyling.quickTitle,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Small Grass - 3 hours',
                                style: TextStyling.title2,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ico.svg',
                                    color: homeIconColor,
                                    height: 15.51,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 25.49),
                                      child: Text(
                                        futureData.title.isEmpty
                                            ? ''
                                            : futureData.title,
                                        style: TextStyling.title2.copyWith(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
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
                                    style: TextStyling.title2.copyWith(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/path.svg',
                                    color: homeIconColor,
                                    height: 15.51,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 28.49),
                                      child: Text(
                                          futureData.body.isEmpty
                                              ? ''
                                              : futureData.body,
                                          style: TextStyling.title2.copyWith(
                                              fontWeight: FontWeight.w600),
                                          maxLines: 2),
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
                                    style: TextStyling.title2.copyWith(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: homeIconColor,
                                    size: 15.51,
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      futureData.body,
                                      style: TextStyling.title2.copyWith(
                                          fontWeight: FontWeight.w300),
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 260,
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
      bottomNavigationBar: BottomNavigationBarr(),
      bottomSheet: Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 16.0,
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
          shadowColor: Color(0X4C52641A),
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      'https://googleflutter.com/sample_image.jpg',
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
                isClicked == true
                    ? Container(
                        width: 350,
                        height: 60,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TIMER',
                              style: TextStyling.title2.copyWith(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            buildTime(),
                            buttonWidget(),
                          ],
                        ),
                      )
                    : Container(
                        width: 350,
                        height: 60,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 6.0,
                            bottom: 0.0,
                          ),
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
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                        if (isClicked == true) {
                          _periodicTimerProvider.timerIncreament();
                        } else {
                          _periodicTimerProvider.stopTimer();
                        }
                      });
                    },
                    child: Container(
                      width: double.infinity,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
