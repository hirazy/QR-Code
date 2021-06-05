import 'package:flutter/cupertino.dart';
import 'package:qrcode_app/db/database_provider.dart';

class QRFields {
  static final List<String> values = [
    /// Add all fields
    id, type, time, title, content, isFavorite
  ];

  static final String id = '_id';
  static final String type = 'type';
  static final String time = 'time';
  static final String title = 'title';
  static final String content = 'content';
  static final String isFavorite = 'isFavorite';
}

class QRCode {
  final int id;
  final int type;
  final String time;
  final String title;
  final String content;
  final bool isFavorite;

  const QRCode(
      {this.id,
      @required this.type,
      @required this.time,
      @required this.title,
      @required this.content,
      @required this.isFavorite});

  QRCode copy(
          {int id,
          bool type,
          int time,
          String title,
          String content,
          DateTime isFavorite}) =>
      QRCode(
        id: id ?? this.id,
        type: type ?? this.type,
        time: time ?? this.time,
        title: title ?? this.title,
        content: content ?? this.content,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      QRFields.id: id,
      QRFields.type: type,
      QRFields.time: time,
      QRFields.title: title,
      QRFields.content: content,
      QRFields.isFavorite: isFavorite ? 1 : 0
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  static QRCode fromJson(Map<String, Object> json) => QRCode(
        id: json[QRFields.id] as int,
        type: json[QRFields.type] as int,
        time: json[QRFields.time] as String,
        title: json[QRFields.title] as String,
        content: json[QRFields.content] as String,
        isFavorite: json[QRFields.isFavorite] == 1,
      );
}
