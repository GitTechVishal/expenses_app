import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  //constructor.
  Chart(this.recentTransactions);
  //creating getter is the property which is calculate dynamicaly.
  List<Map<String, Object>> get groupedTransactionsValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      //For Loop.
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
        ;
      }
      // print(weekDay);
      // print(DateFormat.E().format(weekDay));
      // print(totalSum);
//DateFormate.E will get the 1st Char of the week as per weekday with
//the help of intel.dart
//substring used to get 1st char of week days name
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpending {
    // return groupedTransactionsValue.fold(initialValue, (previousValue, element) => null)
    return groupedTransactionsValue.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValue.map((data) {
            // return Text('${data['day']}: ${data['amount']}');
            //ChartBar User created Widget.
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  (data['day'] as String),
                  (data['amount'] as double),
                  //ternery expression.// to overcome from initial level error.
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
