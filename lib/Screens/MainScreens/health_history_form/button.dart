import 'package:flutter/material.dart';

class OutlineeButton extends StatefulWidget {
  final Function()? tap;
  final bool? val;

  OutlineeButton({this.tap, this.val});

  @override
  _OutlineeButtonState createState() => _OutlineeButtonState();
}

class _OutlineeButtonState extends State<OutlineeButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
        child: Text(widget.val == true ? 'Key' : 'No'),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size.fromHeight(52),
          ),
          backgroundColor: MaterialStateProperty.all(
            widget.val == true ? Color(0xFF182B2B) : Color(0xFF3A4146),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
          foregroundColor: MaterialStateProperty.all<Color>(
            widget.val == true ? Color(0xFF1DC3A7) : Color(0xFFE4E4E4),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color:
                    widget.val == true ? Color(0xFF1DC3A7) : Color(0xFF3A4146),
              ),
            ),
          ),
        ),
        onPressed: () => null);
    // return OutlinedButton(
    //   onPressed: widget.tap,
    //   style: OutlinedButton.styleFrom(
    //     backgroundColor:
    //         widget.val == true ? Color(0xFF182B2B) : Color(0xFF3A4146),
    //     // minimumSize: Size(size.width / 2.5, 52),
    //     minimumSize: Size.fromHeight(52),
    //     textStyle: TextStyle(
    //       fontFamily: 'Rubrik New',
    //       fontSize: 13.0,
    //       fontWeight: FontWeight.bold,
    //     ),
    //     primary: widget.val == true ? Color(0xFF1DC3A7) : Color(0xFFE4E4E4),
    //     side: BorderSide(
    //       width: widget.val == true ? 2 : 0,
    //       color: widget.val == true ? Color(0xFF1DC3A7) : Color(0xFF3A4146),
    //       // style: BorderStyle.none,
    //     ),
    //   ),
    //   child: Text(widget.val == true ? 'Key' : 'No'),
    // );
  }
}
