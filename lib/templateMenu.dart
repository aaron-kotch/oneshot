import 'package:flutter/material.dart';

class TemplateDialog extends StatefulWidget {
  const TemplateDialog({Key? key}) : super(key: key);

  @override
  _TemplateDialogState createState() => _TemplateDialogState();
}

class _TemplateDialogState extends State<TemplateDialog> {

  Color textColor = Color(0xffD5754A);
  Color orangeAccent = Color(0xffD5754A);
  Color baseColor = Color(0xff1E1E1E);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.grey[800],
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 12),
          //   child: Text(
          //     "Template Menu",
          //     style: TextStyle(
          //       fontFamily: 'Calibri',
          //       fontWeight: FontWeight.w700,
          //       fontSize: 18,
          //       color: orangeAccent,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
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
                                AssetImage("assets/icons/telegram.png"),
                                color: Colors.white,
                              ),
                              onPressed: () {

                              },
                            ),
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
                          Ink(
                            decoration: ShapeDecoration(
                              color: orangeAccent,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: ImageIcon(
                                AssetImage("assets/icons/clapperboard.png"),
                                color: Colors.white,
                              ),
                              onPressed: () {

                              },
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
            padding: const EdgeInsets.symmetric(vertical: 12),
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
      ),
    );
  }
}
