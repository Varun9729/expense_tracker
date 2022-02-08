import 'package:expense_tracker/button.dart';
import 'package:expense_tracker/top_card.dart';
import 'package:expense_tracker/transaction.dart';
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
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TopCard(
                  balance: '10,000',
                  income: '100',
                  expense: '200',
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Container(
                    child: Center(
                        child: Column(
                      children: [MyTransaction()],
                    )),
                  ),
                ),
                PlusButton(),
              ],
            ),
          )),
    );
  }
}
