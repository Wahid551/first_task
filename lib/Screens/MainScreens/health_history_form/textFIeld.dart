import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hintTextt;
  TextFieldWidget({this.hintTextt});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Color(0xFF1DC3A7),
      decoration: InputDecoration(
        hintText: widget.hintTextt,
        hintStyle: new TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.4),
          fontFamily: 'Rubrik New',
          fontSize: 17.0,
          fontWeight: FontWeight.w100,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.4),
          ),
        ),
      ),
    );
  }
}
