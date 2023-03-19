import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exp.App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String? titleInput;
  // String?  amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Expenses Calculator App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart!'),
                elevation: 10,
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
