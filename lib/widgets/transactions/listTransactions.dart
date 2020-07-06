import 'package:flutter/material.dart';
import '../../model/transaction.dart';
import 'transactionItem.dart';

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
                child:
                    Image.asset('assets/images/waiting.gif', fit: BoxFit.cover),
              ),
              SizedBox(height: constraints.maxHeight * 0.1),
              const Text('No Transactions Added',
                  style: TextStyle(fontSize: 16))
            ]);
          })
        : ListView(
            children: transactions
                .map(
                  (transaction) => TransactionItem(
                      key: ValueKey(transaction.id),
                      transaction: transaction,
                      deleteTransaction: deleteTransaction),
                )
                .toList());
  }
}
