import 'package:flutter/material.dart';

class TransactionsCreation extends StatefulWidget {
  final Function createTransaction;
  TransactionsCreation(this.createTransaction);
  @override
  _TransactionsCreationState createState() => _TransactionsCreationState();
}

class _TransactionsCreationState extends State<TransactionsCreation> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isNotEmpty && amount > 0) {
      widget.createTransaction(title, amount);
      Navigator.of(context).pop();
    }
  }

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
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.green,
                  onPressed: submitData,
                  // there's something wrong here, button adds null transaction before method is called
                  // seems like one click on add transaction triggers two, one with an empty form and the next with data
                )
              ]),
        ));
  }
}
