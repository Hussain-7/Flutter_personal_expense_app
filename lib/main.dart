import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Bat", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t3", title: "New Hat", amount: 69.99, date: DateTime.now()),
  ];
  late String titleInput;
  late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter App')),
        body: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart!'),
                  elevation: 5,
                ),
              ),
              Card(
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
              ),
              Column(
                children: transaction.map((tx) {
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
                  ]));
                }).toList(),
              ),
            ]));
  }
}
