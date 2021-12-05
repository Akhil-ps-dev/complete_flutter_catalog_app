import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "kottayam123";
  double pi = 3.4;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('catalog'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('welcome to $days days of $name'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
