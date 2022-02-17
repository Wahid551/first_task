import 'package:first_task/Screens/MainScreens/health_history_form/button.dart';
import 'package:first_task/Screens/MainScreens/health_history_form/primary_button.dart';
import 'package:first_task/Screens/MainScreens/health_history_form/textFIeld.dart';
import 'package:first_task/Screens/MainScreens/health_history_form/textStyle.dart';
import 'package:flutter/material.dart';

class HealthHistoryForm extends StatefulWidget {
  const HealthHistoryForm({Key? key}) : super(key: key);

  @override
  _HealthHistoryFormState createState() => _HealthHistoryFormState();
}

class _HealthHistoryFormState extends State<HealthHistoryForm> {
  bool vall = true;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  int a = 1, b = 2, c = 3, d = 4;
  Widget checkBoxx(String txt, int num) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.red,
            ),
            child: Checkbox(
              side: BorderSide(),
              activeColor: Color(0xFF1DC3A7),
              value: num == 1
                  ? value1
                  : num == 2
                      ? value2
                      : num == 3
                          ? value3
                          : value4,
              onChanged: (value) {
                setState(() {
                  if (num == 1) {
                    value1 = value!;
                    value2 = false;
                    value3 = false;
                    value4 = false;
                  } else if (num == 2) {
                    value1 = false;
                    value2 = value!;
                    value3 = false;
                    value4 = false;
                  } else if (num == 3) {
                    value1 = false;
                    value3 = value!;
                    value2 = false;
                    value4 = false;
                  } else if (num == 4) {
                    value1 = false;
                    value4 = value!;
                    value3 = false;
                    value2 = false;
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          txt,
          style: TextStyle(
            fontFamily: 'Rubrik New',
            color: Color(0xFFFFFFFF),
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF181C1F),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFFE4E4E4),
                          size: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close,
                          color: Color(0xFFE4E4E4),
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    bottom: 20,
                  ),
                  child: Text(
                    'HEALTH HISTORY FORM',
                    style: TextStyle(
                      fontFamily: 'Barlow Condensed',
                      color: Color(0xFFE4E4E4),
                      fontWeight: FontWeight.w400,
                      fontSize: 34,
                    ),
                  ),
                ),
                Text(
                  'Health history 3/4',
                  style: TextStyle(
                    fontFamily: 'Rubrik New',
                    color: Color(0xFFE4E4E4),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: double.infinity,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xFF3A4146),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: size.width / 1.6,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Color(0xFF1DC3A7),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.teal,
                                  blurRadius: 8.0,
                                  offset: Offset(0, 3),
                                  spreadRadius: 0.2,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Have you had any injuries or surgeries in the past that may influence today’s treatment?',
                    style: TextStyle(
                      fontFamily: 'Rubrik New',
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: OutlineeButton(
                          tap: () {
                            // setState(() {
                            //   vall = !vall;
                            // });
                          },
                          val: true,
                        ),
                      ),
                      Expanded(
                        child: OutlineeButton(
                          tap: () {
                            setState(() {
                              vall = !vall;
                            });
                          },
                          val: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: TextFieldWidget(hintTextt: 'Please explain'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Any of the following health conditions that you currently have?',
                        style: SStyling.detail,
                      ),
                      Text(
                        'Please answer honestly, as massage may not be indicated for these conditions.',
                        style: SStyling.detail
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      checkBoxx('Blood clots', 1),
                      SizedBox(
                        height: 18,
                      ),
                      checkBoxx('Infections', 2),
                      SizedBox(
                        height: 18,
                      ),
                      checkBoxx('Pitted edema', 3),
                      SizedBox(
                        height: 18,
                      ),
                      checkBoxx('Congestive heart failure', 4),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: PrimaryButton(
                    tap: () {},
                    text: 'Next',
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
