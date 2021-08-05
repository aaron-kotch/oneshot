import 'package:oneshot/view_pages/aboveTheLine.dart';
import 'package:oneshot/view_pages/otherExpenses.dart';
import 'package:oneshot/view_pages/postProductionExpenses.dart';
import 'package:oneshot/view_pages/productionExpenses.dart';

class Budget {

  const Budget(this.aboveTheLine, this.productionExpenses, this.postProductionExpenses, this.otherExpenses);

  final AboveTheLine aboveTheLine;
  final ProductionExpenses productionExpenses;
  final PostProductionExpenses postProductionExpenses;
  final OtherExpenses otherExpenses;

}