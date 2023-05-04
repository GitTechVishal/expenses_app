import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  // addTx function will called from press button
// we have use this because a
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleControlar = TextEditingController();

  final amountControlar = TextEditingController();

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
    widget.addTx(
      titleControlar.text,
      double.parse(amountControlar.text),
    );
//pop method will close the top most screen
    Navigator.of(context).pop();
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
            //we want to give some hight in Row but Row does not
            //have Hight Property for that we wrap row with container.
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button?.color,
              onPressed: () => submitData(),
            )
          ],
        ),
      ),
    );
  }
}
