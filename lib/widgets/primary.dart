import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../repository/transactionsRepository.dart';
import 'Statistics/chart.dart';
import 'Transactions/transactionsList.dart';
import 'Transactions/transactionsCreation.dart';

class Primary extends StatefulWidget {
  @override
  _PrimaryState createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  List<Transaction> transactions = TransactionsRepository().transactions;

  List<Transaction> get recentTransactions {
    return transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _createTransactionConnection(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionsCreation(_createTransaction);
        });
  }

  void _createTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
        id: (transactions.length++).toString(),
        title: transactionTitle,
        amount: transactionAmount,
        date: DateTime.now());

    setState(() {
      transactions.removeLast(); // this needs to be resolved
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => _createTransactionConnection(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransactions),
            TransactionsList(transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createTransactionConnection(context)),
    );
  }
}
