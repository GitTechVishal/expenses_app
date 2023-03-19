import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  // addTx function will called from press button
// we have use this because a
  final Function addTx;
  final titleControlar = TextEditingController();
  final amountControlar = TextEditingController();

// constructor binding with we are getting from function.
  NewTransactions(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControlar,
              //  onChanged: (val) {
              //    titleInput = val;
              //  },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControlar,
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Colors.purple,
              onPressed: () {
                // .text will give as String but we need in duble
                // so for that we provide amount as follow but that will not work if text comes
                addTx(
                  titleControlar.text,
                  double.parse(amountControlar.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
