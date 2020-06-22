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
    final amount = (_amountController.text.isNotEmpty)
        ? double.parse(_amountController.text)
        : 0;
    if (title.isNotEmpty && amount > 0 && _selectedDate != null) {
      widget.createTransaction(title, amount, _selectedDate);
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
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
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
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          onPressed: _openDatePicker,
                          child: Text(_selectedDate == null
                              ? 'Select Date'
                              : DateFormat.yMMMd().format(_selectedDate)),
                        ),
                        FlatButton(
                          child: Text('Add Transaction',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          textColor: Theme.of(context).primaryColorDark,
                          onPressed: submitData,
                          // there's something wrong here, button adds null transaction before method is called
                          // seems like one click on add transaction triggers two, one with an empty form and the next with data
                        )
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }
}
