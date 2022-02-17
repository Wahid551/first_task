import 'package:flutter/material.dart';

class CheckButtons extends StatefulWidget {
  const CheckButtons({Key? key}) : super(key: key);

  @override
  _CheckButtonsState createState() => _CheckButtonsState();
}

class _CheckButtonsState extends State<CheckButtons> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (_) {},
        value: true,
      ),
    );
  }
}
