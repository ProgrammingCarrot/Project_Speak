import 'package:flutter/material.dart';
import 'apptext.dart';
import 'map.dart';
import 'information.dart';

void main() {
  runApp(const MyApp());
}

// this is the home page for this app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      // set all pages's routes
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home_Page(title: Text_List.appTitle),
        '/map': (context) => const Map_Page(),
        '/information': (context) => const Information_Page()
      },
      theme: ThemeData(
          // set prime app bar color
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // set standard font style
          textTheme: TextTheme(
            // for display(h1, h2, h3)
            displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),   // h1
            displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),  // h2
            displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),   // h3
            // title text
            titleLarge: TextStyle(fontSize: 20),
            titleMedium: TextStyle(fontSize: 18),
            titleSmall: TextStyle(fontSize: 16),
            // body text(example: for button)
            bodyLarge: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 12),
          ),
          // set button style
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              )
          ),
      ),
      home: const Home_Page(title: Text_List.appTitle),
    );
  }
}

class Home_Page extends StatefulWidget {
  const Home_Page({super.key, required this.title});

  final String title;

  @override
  State<Home_Page> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Project Speak 測試平台"),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/information');
                },
                child: Text(Text_List.jumpToInformation,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.brown),
                )
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/map');
                },
                child: Text(Text_List.jumpToMap,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.brown),
                )
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
