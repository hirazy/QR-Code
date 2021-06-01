import 'package:flutter/material.dart';

Container itemDrawer(icon, condition, title, click) {
  return Container(
    color: condition == true? ThemeData().primaryColor: Colors.white,
      child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          onTap: click));
}
