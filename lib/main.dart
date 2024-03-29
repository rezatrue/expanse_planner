import 'package:expanse_planner/wedgets/chart.dart';

import './wedgets/transaction_list.dart';

import './wedgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = 
  [
    // Transaction(id: 't1', title: 'New Show', amount: 69.59, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Daily Groceries', amount: 25.85, date: DateTime.now()),
  ];

List<Transaction> get _recentTransactions{

  return _userTransactions.where((tx){
    return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
  }).toList();
}
  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction (
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }
  
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (bCntx) {
        return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        ); 
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Expanse Planner',),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                 onPressed: () => _startAddNewTransaction(context),
                 ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Card(
                      child: Text('Card!!',),
                      elevation: 5,
                    ),
                ),
                Chart(_recentTransactions),
                TransactionList(_userTransactions),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
    );
  }
}

