import 'package:flutter/material.dart';

class TransactionsCreation extends StatelessWidget {
  final Function createTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionsCreation(this.createTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                ),
                FlatButton(
                    child: Text('Add Transaction'),
                    textColor: Colors.green,
                    onPressed: () {
                      // there's something wrong here, button adds null transaction before method is called
                      // seems like one click on add transaction triggers two, one with an empty form and the next with data
                      createTransaction(titleController.text,
                          double.parse(amountController.text));
                    })
              ]),
        ));
  }
}
