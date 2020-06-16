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
        child: transactions.isEmpty
            ? Column(children: <Widget>[
                Container(
                    height: 300,
                    child: Image.asset('assets/images/waiting.gif',
                        fit: BoxFit.cover)),
                SizedBox(height: 20),
                Text('No Transactions Added', style: TextStyle(fontSize: 16))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile();
                },
                itemCount: transactions.length));
  }
}
