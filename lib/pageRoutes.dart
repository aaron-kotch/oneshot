import 'package:flutter/material.dart';
import 'package:oneshot/newOtherExpenses.dart';

import 'package:oneshot/postProductionExpenses.dart';
import 'package:oneshot/productionExpenses.dart';
import 'package:oneshot/settings.dart';
import 'aboveTheLine.dart';
import 'classes/BudgetDetails.dart';
import 'main.dart';
import 'newAboveTheLine.dart';
import 'newPostProduction.dart';
import 'newProductionExpenses.dart';
import 'viewProject.dart';
import 'otherExpenses.dart';

Route toAboveTheLine(AboveTheLine atl) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => atl,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewAboveTheLine(List<BudgetDetails> list, int index) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewAboveTheLine(list: list, projectIndex: index),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toProductionExpenses(ProductionExpenses pE) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pE,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewProductionExpenses(List<List<BudgetDetails>> list, int index) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewProductionExpenses(list: list, projectIndex: index),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toPostProductionExpenses(PostProductionExpenses pPE) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pPE,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewPostProductionExpenses(List<BudgetDetails> list, int index) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewPostProduction(list: list, projectIndex: index),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toOtherExpenses(OtherExpenses oE) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => oE,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewOtherExpenses(List<BudgetDetails> list, int index) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewOtherExpenses(list: list, projectIndex: index),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toMain() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, -1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}

Route toSettings() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Settings(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: SlideTransition(
            position: secondTween.animate(secondaryAnimation),
            child: child,
          ),
        );
      }
  );
}

Route toViewProject(int index) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ViewProject(index: index),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}
