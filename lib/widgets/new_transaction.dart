import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx) {
    print("Constructor NewTransaction Widget");
  }

  @override
  State<NewTransaction> createState() {
    print("createState NewTransaction Widget");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  _NewTransactionState() {
    print("Constructor _NewTransactionState");
  }
  @override
  void initState() {
    print("initState _NewTransactionState");
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget _NewTransactionState");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose");
    super.dispose();
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    if (_amountController.text.isEmpty ||
        double.tryParse(_amountController.text) == null) {
      return;
    }
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(_titleController.text, double.parse(_amountController.text),
        _selectedDate);
    // To close the bottom sheet after we pass input
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  // onChanged: (String value) => titleInput = value
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  // onChanged: (String value) => amountInput = value
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? "No date Chosen!"
                          : "Picked Date : ${DateFormat.yMd().format(_selectedDate as DateTime)}"),
                    ),
                    FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: const Text("Choose Date",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: _presentDatePicker)
                  ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          primary: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor),
                      child: const Text("Add Transaction"),
                      onPressed: _submitData,
                    ))
              ]),
        ),
      ),
    );
  }
}
