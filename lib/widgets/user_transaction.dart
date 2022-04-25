import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Bat", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Hat", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Hat", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Hat", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Hat", amount: 69.99, date: DateTime.now()),
  ];
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(_addNewTransaction),
      TransactionList(transactions: _userTransaction),
    ]);
  }
}
