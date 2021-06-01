import 'package:flutter/material.dart';

Card cardOption(icon, content, onTap){
  return Card(
    child: InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 25,
            ),
            SizedBox(
              height: 10,
            ),
            Text(content)
          ],
        ),
      ),
    ),
  );
}