import 'package:expenses_app/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // you can delete this since we have singlechildscrollview in the main.dart
      // child: SingleChildScrollView(
      //   child: Column
      child: ListView(
          children: transactions.map((tra) {
        return Card(
            child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.purple,
                      width: 2,
                      style: BorderStyle.solid)),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                '\$${tra.amount.toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tra.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(DateFormat.yMMMMd().format(tra.date),
                    style: const TextStyle(color: Colors.grey))
              ],
            )
          ],
        ));
      }).toList()),
    );
  }
}
