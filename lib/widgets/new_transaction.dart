import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (String value) => amountInput = value
                controller: amountController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: const Text("Add Transaction"),
                    onPressed: () {
                      print(titleController.text);
                      print(amountController.text);
                    }),
              )
            ]),
      ),
    );
  }
}
