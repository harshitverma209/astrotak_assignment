import 'package:flutter/material.dart';

const headingText = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const usualText = TextStyle(
  fontSize: 16,
);

const tabTitleText = TextStyle(color: Colors.orange);
const tableHeading =
    TextStyle(color: Colors.indigo, fontSize: 12, fontWeight: FontWeight.w300);
const tableData = TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
final textFieldLabel = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);

final textFieldDecoration = InputDecoration(border: OutlineInputBorder());

final innerButtonStyle = ButtonStyle(
    side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
    backgroundColor: MaterialStateProperty.all(Colors.white));

final outerButtonStyle = ButtonStyle(
    side: MaterialStateProperty.all(const BorderSide(
      color: Colors.orange,
    )),
    backgroundColor: MaterialStateProperty.all(Colors.white));

final fAndFButton = ElevatedButton.styleFrom(
    primary: Colors.orange,
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300));
