import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTransaction);

  final Function addTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _itemInputController = TextEditingController();

  final _amountInputController = TextEditingController();
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _itemInputController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Purchase item?',
              ),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _amountInputController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'cost',
              ),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_selectedDate == null
                      ? 'No date chosen!'
                      : 'Picked date: \n${DateFormat('d MMM yy').format(_selectedDate)}'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {
    if (_amountInputController.text.isEmpty) {
      return;
    }
    final enteredItem = _itemInputController.text;
    final enteredAmount = double.tryParse(_amountInputController.text);

    if (enteredAmount <= 0 || enteredItem.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTransaction(
      enteredItem,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
