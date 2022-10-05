import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var wallpaper = [
    'images/item-1.jpeg',
    'images/item-2.jpeg',
    'images/item-3.jpeg',
    'images/item-4.jpeg',
  ];

  final tech = TextEditingController();

  void setwallpper(ctx) {
    showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: const Text('add this images as wallpaper'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('no')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('yes'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 30)),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'wallpaper app',
              style: TextStyle(fontSize: 40),
            ),
            centerTitle: true,
          ),
          body: // Image.asset('images/item-1.jpeg')
              ListView.builder(
            //to sco;; in horizonta l direction
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                // for images effect click waghera we will use inkwell widget

                child: InkWell(
                  onTap: () => setwallpper(context),
                  child: Ink.image(
                    image: AssetImage(wallpaper[index]),
                    width: MediaQuery.of(context).size.width - 20,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: wallpaper.length,
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
