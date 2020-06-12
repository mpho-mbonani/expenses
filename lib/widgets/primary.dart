import 'package:expenses/widgets/Transactions/transactionsList.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../repository/transactionsRepository.dart';
import 'Transactions/transactionsCreation.dart';

class Primary extends StatefulWidget {
  @override
  _PrimaryState createState() => _PrimaryState();
}

class _PrimaryState extends State<Primary> {
  List<Transaction> transactions = TransactionsRepository().transactions;

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
      transactions.removeLast();
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
                color: Colors.black,
              ),
              onPressed: () => _createTransactionConnection(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
