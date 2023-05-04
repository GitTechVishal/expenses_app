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

      //instead of constext can give any thing i.e ctx.
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transactions added Using yet!',
                    style: Theme.of(context).textTheme.headline6),
                //SizedBox used to give sapce in between elements.
                // it is empty box but still ocupied the space of screen
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    //leading begining List Style.
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
//this will not needed with ListView Builder its simply take number of
//items from itemCount with transactions.
//        children: transactions.map((tx) {}).toList(),
            ),
    );
  }
}
