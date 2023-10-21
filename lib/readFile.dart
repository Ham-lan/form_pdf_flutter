import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:form_pdf_creator/fileRepository.dart';
import 'package:form_pdf_creator/pdfForm.dart';
import 'package:form_pdf_creator/pdfRepository.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfReader extends StatefulWidget {
  const PdfReader({Key? key}) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {

  // late Future<String> text;



  @override
  Widget build(BuildContext context) {
    // Future<String> text = PdfRepository().readFile()  ;



    return Scaffold(
      body: Column(
        children: [
          // FutureBuilder<String>(
          //   future: FileRepository().readFile(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       // While the Future is running, show a loading indicator.
          //       return const CircularProgressIndicator();
          //     } else if (snapshot.hasError) {
          //       // If there is an error, show an error message.
          //       return Text('Error: ${snapshot.error}');
          //     } else {
          //       // If the Future has completed successfully, display the result.
          //       return Text('Fetched String: ${snapshot.data}');
          //     }
          //   },
          // ),

          Expanded(
            child: PDFView(
              filePath: '/storage/emulated/0/Android/data/com.example.form_pdf_creator/files/my_folder/example.pdf',
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: false,
              onRender: (_pages) {
                // setState(() {
                //   pages = _pages;
                //   isReady = true;
                // });
              },
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              // onViewCreated: (PDFViewController pdfViewController) {
              //   _controller.complete(pdfViewController);
              // },
              // onPageChanged: (int page, int total) {
              //   print('page change: $page/$total');
              // },
            ),
          ),

          // ElevatedButton(
          //   onPressed: (){
          //     PdfRepository().deleteFile();
          //     // Navigator.push(context, MaterialPageRoute(builder: (context) => MyForm() ));
          //     Navigator.pop(context);
          //     },
          //   child: Text('Create another pdf'),
          // )

        ],
      ),



    );
  }
}
