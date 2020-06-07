import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((transaction) {
      return Card(
        child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              'R ${transaction.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2)),
            padding: EdgeInsets.all(10),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(transaction.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(
                  DateFormat.yMMMd().format(transaction.date),
                  style: TextStyle(color: Colors.grey),
                ),
              ])
        ]),
      );
    }).toList());
  }
}
