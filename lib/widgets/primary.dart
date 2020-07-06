import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'metrics/chart.dart';
import 'transactions/listTransactions.dart';
import 'transactions/createTransaction.dart';
import '../model/transaction.dart';
import '../repository/transactionsRepository.dart';

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
          return CreateTransaction(_createTransaction);
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
      transactions.removeLast(); // TODO: this needs to be resolved
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
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.tune,
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

    final drawer = Drawer(
      elevation: 5,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 3'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 4'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 5'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar,
        drawer: drawer,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[chart, transactionList],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createTransactionConnection(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).backgroundColor,
          shape: CircularNotchedRectangle(),
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.subject),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(MdiIcons.chartDonut),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
