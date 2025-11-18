import 'package:flutter/material.dart';
import 'apptext.dart';
import 'pdfread.dart';

class Information_Page extends StatelessWidget{
  const Information_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Text_List.jumpToInformation,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.builder(
            itemCount: Text_List.pdfFiles.length,
            itemBuilder: (context,index){
              final pdfFile = Text_List.pdfFiles[index];
              return ListTile(
                title: Text(
                  pdfFile['title']!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/pdfread',
                    arguments: {
                      'title': pdfFile['title'],
                      'path': pdfFile['path'],
                    }
                  );
                }
              );
            }
        ),
    );
  }
}