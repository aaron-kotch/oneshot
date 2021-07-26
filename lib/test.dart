import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  bool expanded = false;
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (index, state) {
                  setState(() {
                    expanded = !state;
                  });
                },
                children: [
                  ExpansionPanel(
                    isExpanded: expanded,
                      headerBuilder: (context, isOpen) {
                        return Container(
                          color: Colors.red[200],
                        );
                      },
                      body: Container(
                        color: Colors.yellow[200],
                        height: 300,
                      ))
                ],
              ),
            ],
          ),
        )
    );
  }
}
