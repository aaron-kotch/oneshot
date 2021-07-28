import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/aboveTheLine.dart';
import 'package:oneshot/classes/AboveTheLineObject.dart';
import 'package:oneshot/projectBottomSheet.dart';
import 'package:oneshot/newSubBudgetTile.dart';

class NewAboveTheLine extends StatefulWidget {
  const NewAboveTheLine({Key? key}) : super(key: key);

  @override
  _NewAboveTheLineState createState() => _NewAboveTheLineState();
}

class _NewAboveTheLineState extends State<NewAboveTheLine> {

  Color textColor = Color(0xffD2480A);
  Color subTextColor = Color(0xff999999);
  Color borderColor = Color(0xff0E0E0E);

  List<List<TextEditingController>> _textController = [];

  List<String> titleList = ["Development Rights", "Story & Rights", "Director & Staff", "Cast", "Travel & Living"];
  List newList = [];

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

    for (var i in AboveTheLine.itemList) {
      newList.add(i.title);
    }

    newList = titleList.where((element) => !newList.contains(element)).toList();
    _textController = new List.generate(newList.length, (index) => [new TextEditingController(), new TextEditingController()]);
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
                          print(AboveTheLine.itemList.length);

                          setState(() {
                            updateList();
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
                  itemCount: newList.length,
                  itemBuilder: (context, index) {
                    return NewSubBudgetTile(
                      payeeController: _textController[index][0],
                      amountController: _textController[index][1],
                      title: newList[index],
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

  void updateList() {

    for (int i = 0; i < _textController.length; i++) {
      if (_textController[i][0].text.isNotEmpty && _textController[i][1].text.isNotEmpty) {
        AboveTheLineObject object = new AboveTheLineObject(title: newList[i], totalPayee: _textController[i][0].text, totalAmount: double.parse(_textController[i][1].text).toStringAsFixed(2).toString());

        AboveTheLine.itemList.add(object);

        print(object.totalAmount);
      }
    }
  }
}
