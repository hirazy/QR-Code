import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container itemCreateLabel(icon, String label){
  return Container(
    margin: EdgeInsets.only(top: 15, left: 20),
    child: Row(
      children: [
        Icon(icon),
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(label, style: TextStyle(color: Colors.black),),
        )
      ],
    ),
  );
}