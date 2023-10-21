import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfRepository{
  final pdf = pw.Document();

  Future<void> addData(String path, String name , String age , String email , String gender ) async {
    pdf.addPage(
        pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
            return pw.Column(
              children: [
              pw.SizedBox(height: 100),
              pw.Row(
                children: [
                  pw.Text("Name: $name"
                    , style: const pw.TextStyle(fontSize: 36),
                  ),
                ]
              ),
              pw.Row(
                children: [
                  pw.Text(
                      "Age: $age",
                      style: const pw.TextStyle(fontSize: 36)
                  ),
                ]
              ),
                pw.Row(
                    children: [
                      pw.Text(
                          "Email: $email",
                          style: const pw.TextStyle(fontSize: 36)
                      ),
                    ]
                ),
                pw.Row(
                    children: [
                      pw.Text(
                          "Gender: $gender",
                          style: const pw.TextStyle(fontSize: 36)
                      ),
                    ]
                ),
            ],
          );
        }
    )
    ); // Page


    // On Flutter, use the [path_provider](https://pub.dev/packages/path_provider) library:
//   final output = await getTemporaryDirectory();
//   final file = File("${output.path}/example.pdf");
    final file = File('$path/example.pdf');
    await file.writeAsBytes(await pdf.save());


  }

  Future<void> deleteFile() async {

    // Get the path to the file that you want to remove.
    const filePath = '/storage/emulated/0/Android/data/com.example.form_pdf_creator/files/my_folder/example.pdf';

    // Create a new File object with the full path to the file.
    final file = File(filePath);

    // If the file exists, delete it using the `delete()` method.
    if (file.existsSync()) {
      await file.delete();
    }

  }

}
