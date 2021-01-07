import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.addTransaction);

  final Function addTransaction;

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
            ),
            TextField(
              controller: amountInputController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'cost',
              ),
            ),
            FlatButton(
              onPressed: () {
                addTransaction(itemInputController.text,
                    double.tryParse(amountInputController.text));
              },
              child: Text('Submit'),
              textColor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
