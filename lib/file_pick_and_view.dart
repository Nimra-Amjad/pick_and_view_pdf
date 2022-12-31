import 'dart:io';
import 'dart:typed_data';

import 'package:fcm_push_notification/view_pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FilePickAndView extends StatefulWidget {
  const FilePickAndView({super.key});

  @override
  State<FilePickAndView> createState() => _FilePickAndViewState();
}

class _FilePickAndViewState extends State<FilePickAndView> {
  String?  fileurl;

  pick1pdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    File file1 = File(result.files.single.path!);
    Uint8List bytes = file1.readAsBytesSync();
    String name = result.files.first.name;
    print(file1.path);
    print(name);

    var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");
    UploadTask task = pdfFile.putData(bytes);
    TaskSnapshot snapshot = await task;
    fileurl = await snapshot.ref.getDownloadURL();
    print(fileurl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: pick1pdf,
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("Select pdf"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPdf(fileurl: fileurl!)));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text("Open pdf"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
