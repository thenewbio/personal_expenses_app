import 'package:expenses_app/widget/new_transaction.dart';
import 'package:expenses_app/widget/transaction_list.dart';
import 'package:expenses_app/widget/user_transaction.dart';
import 'package:flutter/material.dart';

import 'model/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Expenses App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String titleInput;
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New shirt', amount: 100.0, date: DateTime.now()),
    Transaction(id: 't2', title: 'New shoe', amount: 10.0, date: DateTime.now())
  ];

  void _addTransaction(String title, double amount) {
    final newTransact = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTransact);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(addTx: _addTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.purple),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(
                Icons.add,
                color: Colors.purple,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                color: Colors.purple,
                child: Center(
                  child: Text(
                    'Chart!'.toUpperCase(),
                  ),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(
              transactions: _userTransaction,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
          color: Colors.purple,
        ),
      ),
    );
  }
}
