import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_pdf_creator/pdfRepository.dart';
import 'package:form_pdf_creator/readFile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _createPdf() async {
    final PdfDocument document = PdfDocument();

    // Create a page in the PDF document.
    final PdfPage page = document.pages.add();

    // Add the form data to the PDF page.
    page.graphics.drawString(
      'Name: ${_nameController.text}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),

    );

    page.graphics.drawString(
      'Age: ${_ageController.text}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      // const Offset(10, 50),
    );

    // Save the PDF document to a file.
    final filename = 'my_pdf.pdf';
    File(filename).writeAsBytes(await document.save()  );
    document.dispose();


    // Open the PDF document.
    // await PdfDocument.open(filename) ;

    //Load an existing PDF document.
    final PdfDocument pdfDocument = PdfDocument(inputBytes: File('input.pdf').readAsBytesSync());
    //Extract the text from all the pages.
    String text = PdfTextExtractor(pdfDocument).extractText();
    //Dispose the document.
    document.dispose();

  }


  // Future<void> saveFile() async {
  //   // Get the directory where the file will be saved
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   String filePath = '${directory.path}/my_file.txt';
  //
  //   // Create and write to the file
  //   File file = File(filePath);
  //   await file.writeAsString('Hello, this is my saved file content!');
  // }
  //
  // Future<String> readFile() async {
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   String filePath = '${directory.path}/my_file.txt';
  //
  //   File file = File(filePath);
  //   if (await file.exists()) {
  //     String fileContent = await file.readAsString();
  //     return fileContent;
  //   } else {
  //     return 'File not found';
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            ElevatedButton(
              onPressed: (){
                PdfRepository().saveFile();
                Navigator.push(context, MaterialPageRoute(builder: (context) => PdfReader()));

              },
              child: Text('Create PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
