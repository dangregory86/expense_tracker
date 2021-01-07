import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'shoes',
      amount: 20.00,
      dtg: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'banana',
      amount: 2.00,
      dtg: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      id: DateTime.now().toString(),
      dtg: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
