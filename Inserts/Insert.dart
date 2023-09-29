import 'package:flutter/material.dart';
import 'package:crud_insert/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('Insert Products'),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter the name')
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter the price')
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter the Description')
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text ('Insert'),
          ),
        )


      ],),
      )
    );
      
  }
}

