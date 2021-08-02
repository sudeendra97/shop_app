import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  String? _titleinput;

  double _amountinput = 0;
  DateTime _selectdate = DateTime.now();

  void _submitData() {
    if (_titleinput!.isEmpty) {
      return;
    }
    final enteredtitle = _titleinput;
    final enteredamount = _amountinput;
    if (enteredtitle!.isEmpty || enteredamount <= 0) {
      return;
    }
    widget.addTx(
      enteredtitle,
      enteredamount,
      _selectdate,
    );
    Navigator.of(context).pop();
  }

  void _presentdatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectdate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              right: 10,
              left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),
                onChanged: (val) {
                  _titleinput = val;
                },
              ),
              // ignore: prefer_const_constructors
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                onChanged: (val) {
                  _amountinput = double.parse(val);
                },
              ),
              Container(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectdate == null
                            ? 'No Date choosen'
                            : 'picked date: ${DateFormat.yMd().format(_selectdate)}',
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: _presentdatepicker,
                            child: const Text(
                              'Choose date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            onPressed: _presentdatepicker,
                            child: const Text(
                              'Choose date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                //  () {
                //   // print(titleController.text);
                //   // print(amountController.text);
                //   // addTx(titleController.text,
                //   //     double.tryParse(amountController.text));

                // },
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button!.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
