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
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: Row(children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: Text(
                        "\$${transactions[index].amount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                        ))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      // style: const TextStyle(
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      // )
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(DateFormat.yMMMd().format(transactions[index].date),
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey))
                  ],
                ),
              ]),
            );
          }),
    );
  }
}
