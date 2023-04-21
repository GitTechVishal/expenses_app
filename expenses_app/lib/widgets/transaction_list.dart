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
                Text('No transactions added yet!',
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
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Text(
                          // tx.amount.toString(),
                          //String Interpolation

                          // with ListBuilder there are a Index value which show
                          //what record number we are showing or access.
                          // '\$${tx.amount}',
                          //to show only 2 value after decimal use
                          //toStringAsFixed(2)
                          '\$${transactions[index].amount.toStringAsFixed(2)}',

                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                              // tx.title,
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6
                              // style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 16,
                              //     color: Theme.of(context).primaryColorDark),
                              ),
                          Text(
                            //tx.date.toString(),
                            DateFormat.yMMMEd().format(
                                // tx.date,
                                transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
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
