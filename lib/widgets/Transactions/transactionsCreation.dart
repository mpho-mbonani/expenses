import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsCreation extends StatefulWidget {
  final Function createTransaction;
  TransactionsCreation(this.createTransaction);
  @override
  _TransactionsCreationState createState() => _TransactionsCreationState();
}

class _TransactionsCreationState extends State<TransactionsCreation> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final title = _titleController.text;
    final amount = double.parse(_amountController.text);
    if (title.isNotEmpty && amount > 0) {
      widget.createTransaction(title, amount);
      Navigator.of(context).pop();
    }
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          _selectedDate = selectedDate;
        });
      }
    });
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
                  controller: _titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(children: <Widget>[
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : DateFormat.yMd().format(_selectedDate)),
                    FlatButton(
                        onPressed: _openDatePicker,
                        child: Text('Select Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        textColor: Theme.of(context).primaryColorDark)
                  ]),
                ),
                FlatButton(
                  child: Text('Add Transaction',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  textColor: Theme.of(context).primaryColorDark,
                  onPressed: submitData,
                  // there's something wrong here, button adds null transaction before method is called
                  // seems like one click on add transaction triggers two, one with an empty form and the next with data
                )
              ]),
        ));
  }
}
