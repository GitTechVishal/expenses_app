//foundation.dart is part of the material.dar we can use it insetead

import 'package:flutter/foundation.dart';

class Transaction {
  //variable of this class as final because
  // will never change after this , these are runtime constent.
  final String id;
  final String title;
  final double amount;
  // it  is predefine class , it is not like premitive like above string and double.
  final DateTime date;

// use {} for named argument.(to avoid seq. for defining)
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
