import 'package:flutter/material.dart';
import '../model/transaction.dart';

class LandingPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 'X1', title: 'T-Shirt', amount: 299.99, date: DateTime.now()),
    Transaction(id: 'X2', title: 'Shoes', amount: 699.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.green,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(transaction.amount.toString()),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  padding: EdgeInsets.all(10),
                ),
                Column(children: <Widget>[
                  Text(transaction.title),
                  Text(transaction.date.toString()),
                ])
              ]),
            );
          }).toList())
        ],
      ),
    );
  }
}
