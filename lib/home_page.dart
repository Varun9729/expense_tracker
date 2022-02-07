import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Container(
            height: 60,
            child: Center(
              child: Text('TOTAL BALANCE CARD'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Center(child: Text('TRANSACTIONS')),
            ),
          ),
          Container(
            height: 30,
            child: Center(child: Text("BUTTON")),
          ),
        ],
      )),
    );
  }
}
