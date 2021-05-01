import 'package:expensesApp/widgets/new_transaction.dart';
import 'package:expensesApp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.amber,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.normal),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 30.33, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 12.33, date: DateTime.now()),
    Transaction(id: 't3', title: 'Shampoo', amount: 1.23, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MyFancyAddController(_addNewTransaction),
            MyFancyTransactionsList(_userTransactions, _removeTransaction),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ));
  }
}

class MyFancyTransactionsList extends StatelessWidget {
  final List<Transaction> myTransactions;
  final Function deleteTx;

  MyFancyTransactionsList(this.myTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Text('${myTransactions[index].title}'),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTx(myTransactions[index].id),
              )
            ],
          );
        },
        itemCount: myTransactions.length,
      ),
    );
  }
}

class MyFancyAddController extends StatelessWidget {
  final Function addTheTxM;

  MyFancyAddController(this.addTheTxM);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Welcome to input Screen'),
          ElevatedButton(
            child: Text('Press Me'),
            onPressed: () {
              print('Pressed');
              addTheTxM('TheTitle', 20.2);
            },
          )
        ],
      ),
    );
  }
}
