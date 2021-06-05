import 'package:flutter/material.dart';

ListTile itemCreate(icon, title, _onTap) {
  return ListTile(
    leading: Icon(icon, color: Colors.black,),
    title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
    onTap: _onTap,
  );
}