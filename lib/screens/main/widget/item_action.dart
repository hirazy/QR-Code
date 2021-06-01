import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Visibility itemAction(condition, icon, padding, onTap) {
  return Visibility(
      visible: condition,
      child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )));
}
