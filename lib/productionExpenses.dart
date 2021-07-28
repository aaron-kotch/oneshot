import 'package:flutter/material.dart';
import 'package:oneshot/newSubBudgetTile.dart';
import 'package:oneshot/projectBottomSheet.dart';

class ProductionExpenses extends StatefulWidget {
  const ProductionExpenses({Key? key}) : super(key: key);

  @override
  _ProductionExpensesState createState() => _ProductionExpensesState();
}

class _ProductionExpensesState extends State<ProductionExpenses> {

  PageController _pageController = new PageController(initialPage: 0);
  double pageIndex = 0.0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color textColor = Color(0xffD2480A);
    Color subTextColor = Color(0xff999999);
    Color borderColor = Color(0xff0E0E0E);

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
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        child: Text(
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
                child: Stack(
                  children: <Widget>[
                    PageView(
                      controller: _pageController,
                      children: <Widget>[
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              NewSubBudgetTile(title: "Production Staff", payeeController: new TextEditingController(), amountController: new TextEditingController()),
                              // SubBudgetTile(title: "Extra Talent"),
                              // SubBudgetTile(title: "Set Construction"),
                              // SubBudgetTile(title: "Set Design"),
                              // SubBudgetTile(title: "Set Pre-Rig & Strike"),
                              // SubBudgetTile(title: "Set Operations"),
                              // SubBudgetTile(title: "Set Dressing"),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              NewSubBudgetTile(title: "Property", payeeController: new TextEditingController(), amountController: new TextEditingController()),
                              // SubBudgetTile(title: "Wardrobe"),
                              // SubBudgetTile(title: "Electric"),
                              // SubBudgetTile(title: "Camera"),
                              // SubBudgetTile(title: "Production Sound"),
                              // SubBudgetTile(title: "Make-up & Hair"),
                              // SubBudgetTile(title: "Transportation"),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              NewSubBudgetTile(title: "Locations", payeeController: new TextEditingController(), amountController: new TextEditingController()),
                              // SubBudgetTile(title: "Picture Vehicles & Animals"),
                              // SubBudgetTile(title: "Special Effects"),
                              // SubBudgetTile(title: "Visual Effects - Post"),
                              // SubBudgetTile(title: "Film & Lab"),
                              // SubBudgetTile(title: "BTL Travel"),
                            ],
                          ),
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
