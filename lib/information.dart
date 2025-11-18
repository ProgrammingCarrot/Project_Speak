import 'package:flutter/material.dart';
import 'apptext.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class Information_Page extends StatefulWidget{
  const Information_Page({super.key});

  @override
  State<Information_Page> createState() => _Information_State();
}

class _Information_State extends State<Information_Page>{
  String? localPath;

  @override
  void initState(){
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async{

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Text_List.jumpToInformation,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("衛教資訊頁面"),
          ]
        )
      )
    );
  }
}