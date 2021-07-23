import 'package:flutter/material.dart';

class Deleted extends StatefulWidget {
  const Deleted({Key? key}) : super(key: key);

  @override
  _DeletedState createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 28, left: 16, right: 16),
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
                    TextButton(
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {

                      },
                    )
                  ],
                ),
              ),
            ), // top actions bar
          ],
        ),
      ),
    );
  }
}
