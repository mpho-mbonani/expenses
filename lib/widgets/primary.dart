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

  void _createTransactionConnection(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionsCreation(_createTransaction);
        });
  }

  void _createTransaction(String transactionTitle, double transactionAmount,
      DateTime selectedDate) {
    final newTransaction = Transaction(
        id: (transactions.length++).toString(),
        title: transactionTitle,
        amount: transactionAmount,
        date: selectedDate);

    setState(() {
      transactions.removeLast(); // this needs to be resolved
      transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    final appBar = AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => _createTransactionConnection(context))
      ],
    );

    final appBarAndStatusBarHeight =
        appBar.preferredSize.height - mediaQuery.padding.top;

    final chart = Container(
        height: (mediaQuery.size.height - appBarAndStatusBarHeight) * 0.3,
        child: Chart(recentTransactions));

    final transactionList = Container(
        height: (mediaQuery.size.height - appBarAndStatusBarHeight) * 0.7,
        child: TransactionsList(transactions, _deleteTransaction));

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[chart, transactionList],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createTransactionConnection(context)),
    );
  }
}
