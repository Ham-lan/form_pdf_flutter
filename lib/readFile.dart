import 'package:flutter/material.dart';
import 'package:form_pdf_creator/pdfRepository.dart';

class PdfReader extends StatefulWidget {
  const PdfReader({Key? key}) : super(key: key);

  @override
  State<PdfReader> createState() => _PdfReaderState();
}

class _PdfReaderState extends State<PdfReader> {

  // late Future<String> text;



  @override
  Widget build(BuildContext context) {
    Future<String> text = PdfRepository().readFile()  ;

    return Scaffold(
      body: FutureBuilder<String>(
        future: PdfRepository().readFile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the Future is running, show a loading indicator.
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // If there is an error, show an error message.
            return Text('Error: ${snapshot.error}');
          } else {
            // If the Future has completed successfully, display the result.
            return Text('Fetched String: ${snapshot.data}');
          }
        },
      ),
    );
  }
}
