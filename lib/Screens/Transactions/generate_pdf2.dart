import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:external_path/external_path.dart';


class PdfGeneratePage extends StatefulWidget {
  final Map<String, dynamic> data;

  PdfGeneratePage({required this.data});

  @override
  _PdfGeneratePageState createState() => _PdfGeneratePageState();
}

class _PdfGeneratePageState extends State<PdfGeneratePage> {



  Future<void> _generatePdf() async {
    final pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Column(
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              pdfLib.Text('Transaction Reference: ${widget.data['trans_ref']}'),
              pdfLib.Text('Beneficiary Name: ${widget.data['beneficiary_name']}'),
              pdfLib.Text('Beneficiary Mobile: ${widget.data['beneficiary_mobile']}'),
              pdfLib.Text('Amount: ${widget.data['amount']} ${widget.data['source_currency']}'),
              // Add more data as needed

              pdfLib.Text('Transaction from: ${widget.data['username']}'),

            ],
          );
        },
      ),
    );

    final directory = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    final file = File('${directory}/${widget.data['trans_ref']}-${widget.data['beneficiary_name']}.pdf');

    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('PDF generated')));

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    print("####################3");
    print(widget.data);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Receipt'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _generatePdf,
          child: Text('Generate PDF'),
        ),
      ),
    );
  }
}
