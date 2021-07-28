import 'package:flutter/material.dart';

class DropdownGrid extends StatefulWidget {
  const DropdownGrid({Key? key}) : super(key: key);

  @override
  _DropdownGridState createState() => _DropdownGridState();
}

class _DropdownGridState extends State<DropdownGrid> {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    width: width / 3,
                    child: Column(
                      children: [
                        ClipOval(
                            child: Container(
                              color: orangeAccent,
                              child: IconButton(
                                disabledColor: orangeAccent,
                                icon: ImageIcon(
                                  AssetImage("assets/icons/telegram.png"),
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                },
                              ),
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Call Sheet",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: orangeAccent,
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    width: width / 3,
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: orangeAccent,
                            child: IconButton(
                              icon: ImageIcon(
                                AssetImage("assets/icons/clapperboard.png"),
                                color: Colors.white,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Shot List",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: orangeAccent,
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    width: width / 3,
                    child: Column(
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: orangeAccent,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/spreadsheet.png"),
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Budget Sheet",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: orangeAccent,
                            ),
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                    width: width / 3,
                    child: Column(
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: orangeAccent,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/compose.png"),
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "One Liner",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: orangeAccent,
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    width: width / 3,
                    child: Column(
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: orangeAccent,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/folder.png"),
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Storyboard",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: orangeAccent,
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                    width: width / 3,
                    child: Column(
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: orangeAccent,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage("assets/icons/flipboard.png"),
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Concept Board",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: orangeAccent,
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
