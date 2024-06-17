import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      reload();
    });
  }

  void reload(){
    setState(() {
      isFirst = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cross Fade'),
      ),
      body: Center(
        child: AnimatedCrossFade(
            firstChild: Container(
              width: 200,
              height: 300,
              color: Colors.blueGrey,
            ),
            secondChild: Image.asset(
              'assets/images/cross.jpg',
              width: 200,
              height: 300,
            ),
            crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(seconds: 3)),
    ));
  }
}
