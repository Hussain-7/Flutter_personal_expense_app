import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTransaction;
  TransactionItem(
      {required Key key,
      required this.transaction,
      required this.deleteTransaction})
      : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;

  @override
  void initState() {
    // TODO: implement initState
    const colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.orange
    ];
    setState(() {
      _bgColor = colors[Random().nextInt(5)];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor == null ? Colors.black : _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: FittedBox(
                child:
                    Text("\$${widget.transaction.amount.toStringAsFixed(2)}")),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: mediaQuery.size.width > 430
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                textColor: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id))
            : IconButton(
                tooltip: "Delete this record",
                iconSize: 20,
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id)),
      ),
    );
    ;
  }
}
