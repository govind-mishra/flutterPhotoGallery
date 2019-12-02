import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage {
  static Future<String> getDirectoryPath() async{
    final Directory exDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${exDir.path}/Pictures/selfie';
    await Directory(dirPath).create(recursive: true);
    return '$dirPath';
  }

  static Future<String> getFilePath() async{
    String timestamp()=>DateTime.now().millisecondsSinceEpoch.toString();
    final String dirPath = await getDirectoryPath();
    return '$dirPath/${timestamp()}.jpg';
  }
}