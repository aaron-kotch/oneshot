import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oneshot/custom_widgets/projectBottomSheet.dart';
import 'package:oneshot/tiles/newSubBudgetTile.dart';

class NewAboveTheLine extends StatefulWidget {
  const NewAboveTheLine({Key? key, required this.list, required this.projectIndex}) : super(key: key);

  final list;
  final int projectIndex;

  @override
  _NewAboveTheLineState createState() => _NewAboveTheLineState();
}

class _NewAboveTheLineState extends State<NewAboveTheLine> {

  final Color textColor = const Color(0xffD2480A);
  final Color subTextColor = const Color(0xff999999);
  final Color borderColor = const Color(0xff0E0E0E);

  late final List<List<TextEditingController>> _textController;

  final List<String> titleList = ["Development Rights", "Story & Rights", "Director & Staff", "Cast", "Travel & Living"];

  @override
  void dispose() {
    super.dispose();
    for (var x in _textController) { //dispose text controllers
      for (var y in x) {
        y.dispose();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _textController = new List.generate(titleList.length, (index) => [new TextEditingController(), new TextEditingController()]);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff171717),
        systemNavigationBarIconBrightness: Brightness.light
    ));

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
                                return ProjectBottomSheet(index: widget.projectIndex,);
                              });
                        },
                      )
                    ],
                  ),
                ),
              ), // top
              Expanded(
                child: ListView.builder(
                  itemCount: titleList.length,
                  itemBuilder: (context, index) {
                    return NewSubBudgetTile(
                      payeeController: _textController[index][0],
                      amountController: _textController[index][1],
                      title: titleList[index],
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
