import 'package:flutter/material.dart';
import 'transactionsCreation.dart';
import 'transactionsList.dart';
import '../../model/transaction.dart';
import '../../repository/transactionsRepository.dart';

class TransactionsMain extends StatefulWidget {
  @override
  _TransactionsMainState createState() => _TransactionsMainState();
}

class _TransactionsMainState extends State<TransactionsMain> {
  List<Transaction> transactions = TransactionsRepository().transactions;
  
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
    return Column(
      children: <Widget>[
        TransactionsCreation(_createTransaction),
        TransactionsList(transactions),
      ],
    );
  }
}
