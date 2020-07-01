import 'package:flutter/material.dart';
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
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(Icons.more_vert),
      //       color: Theme.of(context).accentColor,
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.tune,
              // Icons.bar_chart,
              // Icons.assignment,
              // Icons.receipt,
              // Icons.crop_free,
              // Icons.payment,
              // Icons.contactless,
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
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      elevation: 5,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 3'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 4'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 5'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _createTransactionConnection(context),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(220, 220, 220, 1),
          shape: CircularNotchedRectangle(),
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.content_paste),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.equalizer),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
