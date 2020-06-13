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
                    height: 200,
                    child: Image.asset('assets/images/waiting.gif',
                        fit: BoxFit.cover)),
                SizedBox(height: 20),
                Text('No Transactions Added', style: TextStyle(fontSize: 16))
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Text(
                          'R ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(transactions[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.5)),
                            ),
                          ])
                    ]),
                  );
                },
                itemCount: transactions.length));
  }
}
