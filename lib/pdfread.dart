import 'package:flutter/material.dart';
import 'apptext.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Pdfread_Page extends StatefulWidget{
  const Pdfread_Page({super.key});

  @override
  State<Pdfread_Page> createState() => _Information_State();
}

class _Information_State extends State<Pdfread_Page>{
  String?localPath;
  late String path;
  late String title;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 接收 pushNamed 傳來的參數
    final args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    title = args['title'] as String;
    path = args['path'] as String;
    _loadPdf();
  }

  Future<void> _loadPdf() async{
    final byte = await rootBundle.load(path);
    final buffer = byte.buffer;

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/$title.pdf");
    await file.writeAsBytes(
        buffer.asUint8List(byte.offsetInBytes,byte.lengthInBytes),
        flush:true);

    setState(() {
      localPath=file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(localPath == null){
      return Scaffold(
        appBar: AppBar(
          title: Text(Text_List.jumpToInformation,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body:PDFView(
          filePath: localPath,
        )
    );
  }
}