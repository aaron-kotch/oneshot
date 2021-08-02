import 'package:oneshot/aboveTheLine.dart';
import 'package:oneshot/otherExpenses.dart';
import 'package:oneshot/postProductionExpenses.dart';
import 'package:oneshot/productionExpenses.dart';

class Budget {

  const Budget(this.aboveTheLine, this.productionExpenses, this.postProductionExpenses, this.otherExpenses);

  final AboveTheLine aboveTheLine;
  final ProductionExpenses productionExpenses;
  final PostProductionExpenses postProductionExpenses;
  final OtherExpenses otherExpenses;

}