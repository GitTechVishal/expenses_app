import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  // addTx function will called from press button
// we have use this because a
  final Function addTx;
  final titleControlar = TextEditingController();
  final amountControlar = TextEditingController();

// constructor binding with we are getting from function.
  NewTransactions(this.addTx);

  // Here we have created Named function which we can call multiple time as required.
  void submitData() {
    final enteredTitle = titleControlar.text;
    final enteredAmount = double.parse(amountControlar.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //Just return given here to stope the code working overhere
      //because after return the code will not executed.
      //returns stop the function execution.
      return;
    }
    // .text will give as String but we need in duble
    // so for that we provide amount as follow but
    //that will not work if text comes
    addTx(
      titleControlar.text,
      double.parse(amountControlar.text),
    );
  }

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
              onSubmitted: (_) => submitData,
              //  onChanged: (val) {
              //    titleInput = val;
              //  },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControlar,
              keyboardType: TextInputType.number,

              // here _ is given that it is convention that
              //I getting a argument but I don't care about it.
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              textColor: Colors.purple,
              onPressed: () => submitData(),
            )
          ],
        ),
      ),
    );
  }
}
