import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oneshot/tiles/newSubBudgetTile.dart';
import 'package:oneshot/custom_widgets/projectBottomSheet.dart';

import '../classes/BudgetDetails.dart';

class NewProductionExpenses extends StatefulWidget {
  const NewProductionExpenses({Key? key, required this.list, required this.projectIndex}) : super(key: key);

  final List<List<BudgetDetails>> list;
  final int projectIndex;

  @override
  _NewProductionExpensesState createState() => _NewProductionExpensesState();
}

class _NewProductionExpensesState extends State<NewProductionExpenses> {

  PageController _pageController = new PageController(initialPage: 0);
  double pageIndex = 0.0;

  final Color textColor = const Color(0xffD2480A);
  final Color subTextColor = const Color(0xff999999);
  final Color borderColor = const Color(0xff0E0E0E);

  late final List<List<List<TextEditingController>>> _textController;

  @override
  void dispose() {
    super.dispose();
    for (var x in _textController) {
      for (var y in x) {
        for (var z in y) {
          z.dispose();
        }
      }
    }
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.page!;
      });
    });

    _textController[0] = new List.generate(widget.list[0].length, (index) => [new TextEditingController(), new TextEditingController()]);
    _textController[1] = new List.generate(widget.list[1].length, (index) => [new TextEditingController(), new TextEditingController()]);
    _textController[2] = new List.generate(widget.list[2].length, (index) => [new TextEditingController(), new TextEditingController()]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<Widget> indicatorWidget = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Hero(
              tag: "index",
              child: const CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Hero(
              tag: "index",
              child: CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CircleAvatar(
              radius: 2.5,
              backgroundColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Hero(
              tag: "index",
              child: CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ];

    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1E1E1E),
          body: Container(
            height: height,
            width: width,
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
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {

                            });
                          },
                        ),
                        Container(
                          child: const Text(
                            'Production Expenses',
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
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
                    child: Stack(
                      children: <Widget>[
                        PageView(
                          controller: _pageController,
                          children: <Widget>[
                            Container(
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 60),
                                itemCount: widget.list[0].length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return NewSubBudgetTile(
                                    title: widget.list[0][index].title,
                                    payeeController: _textController[0][index][0],
                                    amountController: _textController[0][index][1],
                                    list: widget.list[0],
                                    index: index,
                                  );
                                },
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 60),
                                itemCount: widget.list[1].length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return NewSubBudgetTile(
                                    title: widget.list[1][index].title,
                                    payeeController: _textController[1][index][0],
                                    amountController: _textController[1][index][1],
                                    list: widget.list[1],
                                    index: index,
                                  );
                                },
                              ),
                            ),
                            ListView.builder(
                              padding: EdgeInsets.only(bottom: 60),
                              itemCount: widget.list[2].length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return NewSubBudgetTile(
                                  title: widget.list[2][index].title,
                                  payeeController: _textController[2][index][0],
                                  amountController: _textController[2][index][1],
                                  list: widget.list[2],
                                  index: index,
                                );
                              },
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: width,
                              height: 30,
                              child: indicatorWidget[pageIndex.round()],
                            )
                        ),
                      ],
                    )
                ), // main listview
              ],
            ),
          ),
        )
    );
  }
}
