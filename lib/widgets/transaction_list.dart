import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';
import 'package:personal_expense_app/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(
      {required this.transactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: <Widget>[
              SizedBox(height: 10),
              Text("No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 10),
              Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/images/waiting.png",
                      fit: BoxFit.cover)),
            ]);
          })
        : ListView(
            children: <Widget>[
              ...transactions.map((tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    deleteTransaction: deleteTransaction,
                  ))
            ],
          );
  }
}
         
            //     ListView.builder(
            // itemCount: transactions.length,
            // itemBuilder: (ctx, index) {
            //   return TransactionItem(
            //       key: ValueKey(transactions[index].id),
            //       transaction: transactions[index],
            //       deleteTransaction: deleteTransaction);
            // });
       
            // return Card(
            //   child: Row(children: <Widget>[
            //     Container(
            //         margin: const EdgeInsets.all(10),
            //         padding: const EdgeInsets.all(6),
            //         decoration: BoxDecoration(
            //             border: Border.all(
            //                 color: Theme.of(context).primaryColor,
            //                 width: 2,
            //                 style: BorderStyle.solid)),
            //         child: Text(
            //             "\$${transactions[index].amount.toStringAsFixed(2)}",
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 18,
            //               color: Theme.of(context).primaryColor,
            //             ))),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           transactions[index].title,
            //           // style: const TextStyle(
            //           //   fontSize: 18,
            //           //   fontWeight: FontWeight.bold,
            //           // )
            //           style: Theme.of(context).textTheme.headline6,
            //         ),
            //         Text(
            //             DateFormat.yMMMd().format(transactions[index].date),
            //             style: const TextStyle(
            //                 fontSize: 10,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.grey))
            //       ],
            //     ),
            //   ]),
            // );
            // }),
          