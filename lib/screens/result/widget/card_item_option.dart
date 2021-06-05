import 'package:flutter/material.dart';

Container cardOption(icon, content, onTap){
  return Container(
    child: Center(
      child: InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 45,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: Center(
                  child: Text(content),
                ),
                width: 60,
              ),
            )
          ],
        ),
      ),
    ),
    )

  );
}