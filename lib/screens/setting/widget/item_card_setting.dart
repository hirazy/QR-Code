

import 'package:flutter/material.dart';

ListTile itemSetting(String title, String subtitle, bool initValue,  _onChanged){
  return ListTile(
    title: Text(title),
      subtitle: subtitle != "" ? Text(subtitle): null,
    trailing: Checkbox(
        value: initValue,
        activeColor: ThemeData().backgroundColor,
      onChanged: _onChanged,
    )
  );
}

// ListTile(
// title: Text(
// "Bíp"
// ),
// trailing: Checkbox(
// value: beep,
// activeColor: Colors.red,
// onChanged: (value){
// setState(() {
// beep = !beep;
// });
// },
// ),
// )