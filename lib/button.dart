import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffe3f2fd),
          border: Border.all(color: Color(0xffbbdefb), width: 1.5)),
      child: Center(
          child: Text(
        "+",
        style: TextStyle(color: Colors.grey[800], fontSize: 30),
      )),
    );
  }
}
