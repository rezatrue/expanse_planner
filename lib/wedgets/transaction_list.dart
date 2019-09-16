import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

 final List<Transaction> _userTransactions;
 
 TransactionList(this._userTransactions);
  
  @override
  Widget build(BuildContext context) {
    return Column(children: _userTransactions.map((tx) {
                return Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(border: Border.all(color: Colors.purple, style: BorderStyle.solid, width: 2)), 
                    padding: EdgeInsets.all(10),
                    child: Text('\$${tx.amount}' ,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.purple,
                      ),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(tx.title, style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date), 
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      ),
                  ],)
                ],);
                
              }).toList(),);
  }
}