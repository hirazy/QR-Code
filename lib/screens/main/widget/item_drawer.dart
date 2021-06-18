import 'package:flutter/material.dart';

Container itemDrawer(icon, condition, title, click) {
  return Container(
      color: condition == true ? ThemeData().primaryColor : Colors.white,
      child: Wrap(
        children: [
          ListTile(
              leading: icon,
              title:
              Wrap(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  )
                ],
              ),
              onTap: click)
        ],
      ));
}
