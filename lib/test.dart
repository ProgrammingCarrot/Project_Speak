import 'package:flutter/material.dart';
import 'apptext.dart';

class test_Page extends StatelessWidget{
  test_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Text_List.testPageTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: Text_List.vocabs.length,
          itemBuilder: (context,index){
            final item = Text_List.vocabs[index];
            return _vocabCard(item,index,context);
          }),
    );
  }

  Widget _vocabCard(Map<String,String>item,int index,BuildContext context){
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      elevation: 0,
      child:Padding(
        padding: const EdgeInsets.all(16),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${index + 1}",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            ClipRect(
              child: Image.asset(
                item['path']!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Text(
                item['title']!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 16),
            // 錄音 & 播放 按鈕
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // 之後加入錄音功能
                  },
                  icon: const Icon(Icons.mic),
                  label: Text(
                    "錄音",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // 之後加入播放功能
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: Text(
                    "播放",
                    style: Theme.of(context).textTheme.bodySmall
                  ),
                ),
              ],
            )
          ]
        )
      )
    );
  }
}