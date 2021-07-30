import 'package:flutter/material.dart';
import 'package:oneshot/newOtherExpenses.dart';

import 'package:oneshot/postProductionExpenses.dart';
import 'package:oneshot/productionExpenses.dart';
import 'package:oneshot/settings.dart';
import 'aboveTheLine.dart';
import 'classes/Budget.dart';
import 'main.dart';
import 'newAboveTheLine.dart';
import 'newPostProduction.dart';
import 'newProductionExpenses.dart';
import 'newProject.dart';
import 'otherExpenses.dart';

Route toAboveTheLine() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AboveTheLine(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewAboveTheLine(List<Budget> list) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewAboveTheLine(list: list),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toProductionExpenses() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProductionExpenses(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewProductionExpenses(List<List<Budget>> list) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewProductionExpenses(list: list),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toPostProductionExpenses() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PostProductionExpenses(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewPostProductionExpenses(List<Budget> list) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewPostProduction(list: list),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toOtherExpenses() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => OtherExpenses(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}

Route toNewOtherExpenses(List<Budget> list) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewOtherExpenses(list: list),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end: begin).chain(CurveTween(curve: Curves.easeOut));

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

Route createProject() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NewProject(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1, 0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var secondTween = Tween(begin: end, end:begin).chain(CurveTween(curve: Curves.easeInCubic));

        return SlideTransition(
          position: tween.animate(animation),
          child: child,
        );
      }
  );
}
