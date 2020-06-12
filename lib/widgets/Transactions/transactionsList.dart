import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionsList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(
                    'R ${transactions[index].amount.toStringAsFixed(2)}',
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
                      Text(transactions[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ])
              ]),
            );
          },
          itemCount: transactions.length),
    );
  }
}
