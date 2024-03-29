import 'package:flutter/material.dart';

Container textInput(hint, bool inputNumber, TextEditingController control) {
  return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        // maxLength: 100,
        keyboardType: inputNumber == true ? TextInputType.number: TextInputType.text,
        controller: control,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ));
}
