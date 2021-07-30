import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/aboveTheLine.dart';
import 'package:oneshot/classes/Budget.dart';
import 'package:oneshot/projectBottomSheet.dart';
import 'package:oneshot/newSubBudgetTile.dart';

class NewPostProduction extends StatefulWidget {
  const NewPostProduction({Key? key, required this.list}) : super(key: key);

  final list;

  @override
  _NewPostProductionState createState() => _NewPostProductionState();
}

class _NewPostProductionState extends State<NewPostProduction> {

  Color textColor = Color(0xffD2480A);
  Color subTextColor = Color(0xff999999);
  Color borderColor = Color(0xff0E0E0E);

  List<List<TextEditingController>> _textController = [];

  @override
  void dispose() {
    super.dispose();

    for (var x in _textController) {
      for (var y in x) {
        y.dispose();
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _textController = new List.generate(widget.list.length, (index) => [new TextEditingController(), new TextEditingController()]);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff171717),
        systemNavigationBarIconBrightness: Brightness.light
    ));

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 28, left: 16, right: 16, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {

                          });
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: Text(
                          'Above The Line',
                          style: TextStyle(
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_control_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Color(0xff131212),
                              context: context,
                              builder: (context) {
                                return ProjectBottomSheet();
                              });
                        },
                      )
                    ],
                  ),
                ),
              ), // top
              Expanded(
                  child: ListView.builder(
                      itemCount: widget.list.length,
                      itemBuilder: (context, index) {
                        return NewSubBudgetTile(
                          payeeController: _textController[index][0],
                          amountController: _textController[index][1],
                          title: widget.list[index].title,
                          index: index,
                          list: widget.list,
                        );
                      }
                  )
              ), // main listview
            ],
          ),
        ),
      ),
    );
  }
}
