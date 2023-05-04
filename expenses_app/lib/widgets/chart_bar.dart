import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //Variable wich we recived. At the time of calling this.
  final String lable;
  final double spendingAmount;
  final double spendingPctOfTotal;
// Constroctur of the class ChartBar. with
//I will go for positional arguments and I'll get the label,
  ChartBar(this.lable, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    // because we have 3 item from each other above.
    return Column(
      children: <Widget>[
        //'\$${} its a string as you learned,
        //so \$ and then a string interpolation with ${}

        // to Show Amount
        //FittedBox widget fill fit the text in between the available space
        //but not wrap it. to next line.
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        //To fix space in between
        SizedBox(
          height: 4,
        ),
        //For Chart.
        Container(
          height: 60,
          width: 10,
          //Stack allow the given widgets top of the each other. its overlaping
          //the widgets/

          child: Stack(
            children: <Widget>[
              //Back Container with transparent box.
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              //FractionallySizedBox is used dynamically set size box with color.
              // it will fill the color at above container as per expences.
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        //Lable of week days 1st Char.
        Text(lable),
      ],
    );
  }
}
