import 'package:flutter/material.dart';

Container textInput(hint) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
    maxLines: 1,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  ));
}
