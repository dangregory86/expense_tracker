import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTransaction);

  final Function addTransaction;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final itemInputController = TextEditingController();

  final amountInputController = TextEditingController();

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
              controller: itemInputController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Purchase item?',
              ),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: amountInputController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'cost',
              ),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              onPressed: _submitData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitData() {
    final enteredItem = itemInputController.text;
    final enteredAmount = double.tryParse(amountInputController.text);

    if (enteredAmount <= 0 || enteredItem.isEmpty) {
      return;
    }
    widget.addTransaction(
      enteredItem,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }
}
