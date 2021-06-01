import 'package:qrcode_app/db/database_provider.dart';

class QRCode{
  int id;
  int type;
  String time;
  String title;
  String content;
  bool isFavorite;

  QRCode({this.id, this.type, this.time, this.title, this.content, this.isFavorite});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_TYPE: type,
      DatabaseProvider.COLUMN_TIME: time,
      DatabaseProvider.COLUMN_TITLE: title,
      DatabaseProvider.COLUMN_CONTENT: content,
      DatabaseProvider.COLUMN_FAVORITE: isFavorite ? 1: 0
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }

    return map;
  }

  QRCode.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    type = map[DatabaseProvider.COLUMN_TYPE];
    time = map[DatabaseProvider.COLUMN_TIME];
    title = map[DatabaseProvider.COLUMN_TITLE];
    content = map[DatabaseProvider.COLUMN_CONTENT];
    isFavorite = map[DatabaseProvider.COLUMN_FAVORITE] == 1;
  }
}