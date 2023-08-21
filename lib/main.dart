import 'dart:async';
import 'dart:math';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(child: HomeScreen(),)
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    int _counter = 0;
    Offset _offset = Offset.zero; // changed

    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Percent Progress Indicator'),
      ),
      body: Transform(
        // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(pi * _offset.dy / 180) // changed
        ..rotateY(pi * _offset.dx / 180), // changed
      alignment: FractionalOffset.center,
      child: GestureDetector( // new
        onPanUpdate: (details) => setState(() => _offset += details.delta),
        onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          width: 25,
                          height: 450,
                          color: Colors.grey,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40.0),
                          width: 25,
                          height: 25,
                          color: Colors.red,
                        )
                        ],
                      ),
                    ],
                  ),
                  Column
                  (children: [
                    Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 40.0),
                        width: 25,
                        height: 450,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 40.0),
                        width: 25,
                        height: 25,
                        color: Colors.red,
                      )
                    ],
                  ),
                  ],
                  )
                  // Container(
                  // margin: EdgeInsets.only(left: 20.0),
                  // width: 50, height: 500, color: Colors.red,
                  // ),
                  // Container(
                  // margin: EdgeInsets.only(right: 20.0),
                  // width: 50, height: 500, color: Colors.red,
                  // ),
                ],
              )
            ],
          )
        ),
      )
    );
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}


