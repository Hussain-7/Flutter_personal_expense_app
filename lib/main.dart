import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:personal_expense_app/widgets/new_transaction.dart';
import 'package:personal_expense_app/widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
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

          primarySwatch: Colors.purple,
          accentColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => startAddNewTransaction(context),
          child: Icon(Icons.add)),
      body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart!'),
                elevation: 5,
              ),
            ),
            TransactionList(transactions: _userTransaction),
          ]),
    );
  }
}
