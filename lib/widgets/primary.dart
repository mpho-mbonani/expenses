import 'package:flutter/material.dart';
import 'Transactions/transactionsMain.dart';

class Primary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            TransactionsMain()
          ],
        ),
      ),
    );
  }
}
