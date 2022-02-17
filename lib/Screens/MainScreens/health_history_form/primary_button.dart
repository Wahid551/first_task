import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String? text;
  final Function()? tap;
  PrimaryButton({this.tap, this.text});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.tap,
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFF1DC3A7),
        // minimumSize: Size(size.width / 2.5, 52),
        minimumSize: Size.fromHeight(52),
        textStyle: TextStyle(
          fontFamily: 'Rubrik New',
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
        primary: Color(0xFF181C1F),
      ),
      child: Text(widget.text!),
    );
  }
}
