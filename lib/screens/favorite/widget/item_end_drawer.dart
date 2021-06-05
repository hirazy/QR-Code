import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container itemEndDrawer(icon, String title, bool condition, onClick){
  return Container(
      color: condition == true? ThemeData().primaryColor: Colors.black,
      child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(color: condition == true? ThemeData().primaryColor: Colors.black, fontWeight: FontWeight.normal),
          ),
          onTap: onClick));
}