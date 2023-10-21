import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PdfRepository{

  Future<void> saveFile() async {
    // Get the directory where the file will be saved
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/my_file.txt';

    // Create and write to the file
    File file = File(filePath);
    await file.writeAsString('Hello, this is my saved file content!');

  }

  Future<String> readFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/my_file.txt';

    File file = File(filePath);
    if (await file.exists()) {
      debugPrint('Got the file content');
      String fileContent = await file.readAsString();
      debugPrint(fileContent);
      return fileContent;
    } else {
      debugPrint(' Didn''t the file content');
      return 'File not found';
    }
  }

}