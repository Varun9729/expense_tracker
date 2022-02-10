import 'dart:async';

import 'package:expense_tracker/button.dart';
import 'package:expense_tracker/google_sheets_api.dart';
import 'package:expense_tracker/loading.dart';
import 'package:expense_tracker/top_card.dart';
import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textControllerAmount = TextEditingController();
  final _textControllerItem = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isIncome = false;

//to enter transactions into spreadsheet
  void _enterTransaction() {
    GoogleSheetsApi.insert(
        _textControllerAmount.text, _textControllerItem.text, _isIncome);
    setState(() {});
  }

//new Transactions
  void _newTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Center(
                  child: Text(
                    'N E W  T R A N S A C T I O N',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Expense'),
                          Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          Text('Income'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter the Description',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter the Description';
                                  }
                                  return null;
                                },
                                controller: _textControllerAmount,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter the Amount',
                              ),
                              controller: _textControllerItem,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Color(0xff90caf9),
                    child: Text('Cancel',
                        style: TextStyle(color: Colors.grey[800])),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Color(0xff90caf9),
                    child: Text('Enter',
                        style: TextStyle(color: Colors.grey[800])),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _enterTransaction();
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  //wait for data to be fetched from googlesheets
  bool timerStarted = false;
  void startLoading() {
    timerStarted = true;
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (GoogleSheetsApi.loading == false) {
          setState(() {});
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //checking if the loading is complete, then shows the transactions
    if (GoogleSheetsApi.loading == true && timerStarted == false) {
      startLoading();
    }
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TopCard(
                  balance: (GoogleSheetsApi.calculateIncome() -
                          GoogleSheetsApi.calculateExpense())
                      .toString(),
                  income: GoogleSheetsApi.calculateIncome().toString(),
                  expense: GoogleSheetsApi.calculateExpense().toString()),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Expanded(
                          child: GoogleSheetsApi.loading == true
                              ? Loading()
                              : ListView.builder(
                                  itemCount:
                                      GoogleSheetsApi.currentTransaction.length,
                                  itemBuilder: (context, index) {
                                    return MyTransaction(
                                        transactionName: GoogleSheetsApi
                                            .currentTransaction[index][0],
                                        transactionAmount: GoogleSheetsApi
                                            .currentTransaction[index][1],
                                        incomeOrExpense: GoogleSheetsApi
                                            .currentTransaction[index][2]);
                                  },
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              PlusButton(
                function: _newTransaction,
              ),
            ],
          ),
        ));
  }
}
