// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:fcm_push_notification/function.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class PickAndOpenFile extends StatefulWidget {
//   const PickAndOpenFile({super.key});

//   @override
//   State<PickAndOpenFile> createState() => _PickAndOpenFileState();
// }

// class _PickAndOpenFileState extends State<PickAndOpenFile> {
//  late String fileurl1;
//   late String fileurl2;
//   var data;
//   String output = "Initial Output";

//   pick1pdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result == null) return;
//     File file1 = File(result.files.single.path!);
//     Uint8List bytes = file1.readAsBytesSync();
//     String name = result.files.first.name;
//     print(file1.path);
//     print(name);

//     var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");
//     UploadTask task = pdfFile.putData(bytes);
//     TaskSnapshot snapshot = await task;
//     fileurl1 = await snapshot.ref.getDownloadURL();
//     print(fileurl1);
//   }

//   pick2pdf() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result == null) return;
//     File file2 = File(result.files.single.path!);
//     Uint8List bytes = file2.readAsBytesSync();
//     String name = result.files.first.name;
//     print(file2.path);
//     print(name);

//     var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");
//     UploadTask task = pdfFile.putData(bytes);
//     TaskSnapshot snapshot = await task;
//     fileurl2 = await snapshot.ref.getDownloadURL();
//     print(fileurl2);
//   }


//   @override
//   Widget build(BuildContext context) {
//     String url = 'http://127.0.0.1:5000/api?querycv=' + fileurl1.toString() +'&queryjob='+fileurl2.toString();
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 40.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: pick1pdf,
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: 300,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(15)),
//                   child: Text("Select 1st pdf"),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GestureDetector(
//                 onTap: pick2pdf,
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: 300,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(15)),
//                   child: Text("Select 2nd pdf"),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   onPressed: () async {
//                     data = await fetchdata(url);
//                     var decoded = jsonDecode(data);
//                     setState(() {
//                       output = decoded['matching percent'];
//                     });
//                   },
//                   child: Text("Fetch matching percentage")),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 width: 300,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Text("Matching Percentage $output"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
