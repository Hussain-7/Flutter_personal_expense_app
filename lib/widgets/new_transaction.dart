import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    if (amountController.text.isEmpty ||
        double.tryParse(amountController.text) == null) {
      return;
    }
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(titleController.text, double.parse(amountController.text));
    // To close the bottom sheet after we pass input
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (String value) => titleInput = value
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (String value) => amountInput = value
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: const Text("Add Transaction"),
                    onPressed: submitData,
                  ))
            ]),
      ),
    );
  }
}
