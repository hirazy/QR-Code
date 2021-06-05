import 'package:flutter/material.dart';

Container itemCreateDetail(
  String hint,
  bool inputNumber,
  int maxLengths,
  int maxLines,
  TextEditingController controller,
) {
  return Container(
    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
     child: TextField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLengths,
          keyboardType:
          inputNumber == true ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            counterText: maxLengths == 1000 ? "": null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )
      )
  );
}
