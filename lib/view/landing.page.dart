import 'package:flutter/material.dart';
import '../model/transaction.dart';

class LandingPage extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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

          Card(
            child: Text('Expenses List'),
          ),

        ],
      ),
    );
  }
}