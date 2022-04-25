import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter App')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart!'),
                  elevation: 5,
                ),
              ),
              Column(
                children: transaction.map((tx) {
                  return Card(
                      child: Row(children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.purple,
                                width: 2,
                                style: BorderStyle.solid)),
                        child: Text("${tx.amount}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.purple))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(tx.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(tx.date.toString(),
                            style: TextStyle(
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
