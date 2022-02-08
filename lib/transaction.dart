import 'package:flutter/material.dart';

class MyTransaction extends StatelessWidget {
  const MyTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        color: Color(0xffe3f2fd),
        height: 50,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('TRANSACTION'), Text('\$200')],
        )),
      ),
    );
  }
}
