import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'createTransactions.dart';
import 'transactionList.dart';

class TransactionService extends StatefulWidget {
  @override
  _TransactionServiceState createState() => _TransactionServiceState();
}

class _TransactionServiceState extends State<TransactionService> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1', title: 'T-Shirt', amount: 299.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Shoes', amount: 699.99, date: DateTime.now()),
    Transaction(id: '3', title: 'Jeans', amount: 1299.99, date: DateTime.now()),
  ];

  void _createTransaction(String transactionTitle, double transactionAmount) {
    final newTransaction = Transaction(
        id: (_transactions.length++).toString(),
        title: transactionTitle,
        amount: transactionAmount,
        date: DateTime.now());

    setState(() {
      _transactions.removeLast();
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreateTransaction(_createTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
