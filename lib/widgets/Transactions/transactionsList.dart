import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionsList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(children: <Widget>[
              Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset('assets/images/waiting.gif',
                      fit: BoxFit.cover)),
              SizedBox(height: constraints.maxHeight * 0.1),
              Text('No Transactions Added', style: TextStyle(fontSize: 16))
            ]);
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.5,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          'R ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                      ),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: TextStyle(
                        color: Theme.of(context).accentColor.withOpacity(0.5)),
                  ),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      onPressed: () =>
                          deleteTransaction(transactions[index].id)),
                ),
              );
            },
            itemCount: transactions.length);
  }
}
