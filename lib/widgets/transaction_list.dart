import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: transactions.map((tx) {
          return Card(
            child: Row(children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: Text("\$${tx.amount}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(tx.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(DateFormat.yMMMd().format(tx.date),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey))
                ],
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }
}
