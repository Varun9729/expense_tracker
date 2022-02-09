// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyTransaction extends StatelessWidget {
  final String transactionName;
  final String transactionAmount;
  final String incomeOrExpense;

  const MyTransaction(
      {Key? key,
      required this.transactionName,
      required this.transactionAmount,
      required this.incomeOrExpense})
      : super(key: key);

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff90caf9)),
                        shape: BoxShape.circle,
                        color: Color(0xffe3f2fd)),
                    child: Icon(Icons.attach_money_rounded, size: 20),
                  ),
                ),
                Text(transactionName),
              ],
            ),
            Text((incomeOrExpense == 'Expense' ? '-' : '+') + transactionAmount,
                style: TextStyle(
                    color: (incomeOrExpense == 'Expense'
                        ? Colors.red
                        : Colors.green)))
          ],
        )),
      ),
    );
  }
}
