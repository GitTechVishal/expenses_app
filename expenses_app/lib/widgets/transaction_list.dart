import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//.. tells dart to go up one level and check the folder
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        children: transactions.map((tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2)),
                  child: Text(
                    // tx.amount.toString(),
                    //String Interpolation
                    '\$${tx.amount}',

                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      tx.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      //tx.date.toString(),
                      DateFormat.yMMMEd().format(
                        tx.date,
                      ),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
