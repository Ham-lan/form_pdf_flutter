import 'dart:io';
import 'package:form_pdf_creator/pdfRepository.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileRepository{

  Future<void> saveFile(String name, String age, String email, String gender)
  async
  {
    // final externalStorageDirectory = await getExternalStorageDirectory();
    // Get the directory where the file will be saved
    //  Directory directoryTry = await getApplicationDocumentsDirectory();
    //  debugPrint(directoryTry.path);


    // String fileName = Path.join('/storage/emulated/0/', 'MyFolder', 'file.txt');

    // String fileName = '${externalStorageDirectory?.path}/my_folder/my_file.txt' ;

    //
    // Directory directory = Directory(fileName);
    //
    // String filePath = '${directory.path}';

    // filePath = '/storage/emulated/0/MyFolder/myfile.txt';
    //
    // String fileName = Path.join('/storage/emulated/0/', 'MyFolder', 'file.txt');


    final externalStorageDirectory = await getExternalStorageDirectory();
    // String fileName = '${externalStorageDirectory?.path}/my_folder/my_file.txt' ;



    debugPrint('${externalStorageDirectory?.path}');
    final directory = Directory('${externalStorageDirectory?.path}/my_folder');

    // If the directory does not exist,Ali create it using the `create()` method.
    // if (!directory.existsSync()) {
    //   await directory.create();
    //
    //   // Create and write to the file
    //   File file = File('${directory.path}/my_file.txt');
    //   await file.writeAsString('Hello, this is my saved file content!');
    // }

     await PdfRepository().addData( '${directory.path}' , name , age , email , gender);


  }

  Future<String> readFile() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    // String fileName = Path.join('/storage/emulated/0/', 'MyFolder', 'file.txt');

    // Directory directory = Directory(fileName);

    // String filePath = '${directory.path}';

    // filePath = '/storage/emulated/0/MyFolder/myfile.txt';
    //
    // String fileName = Path.join('/storage/emulated/0/', 'MyFolder', 'file.txt');
     final externalStorageDirectory = await getExternalStorageDirectory();
    // String fileName = '${externalStorageDirectory?.path}/my_folder/my_file.txt' ;


    final directory = Directory('${externalStorageDirectory?.path}/my_folder');

    // If the directory does not exist, create it using the `create()` method.
    if (!directory.existsSync()) {
      await directory.create();
    }

    File file = File('${directory.path}/my_file.txt');
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

  void deleteFile(){

  }

}