import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatelessWidget {
  String fileurl;
  ViewPdf({
    Key? key,
    required this.fileurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SfPdfViewer.network(fileurl,
            initialScrollOffset: Offset(0, 500),));
  }
}
