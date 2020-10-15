import 'package:flutter/material.dart';
class MyResult extends StatefulWidget {
  @override
  _MyResultState createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text("My Result"),
      ),
    );
  }
}
