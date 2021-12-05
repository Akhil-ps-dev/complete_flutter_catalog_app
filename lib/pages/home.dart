import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "kottayam123";
  double pi = 3.4;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Catalog App...',
          style: GoogleFonts.pacifico(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
    );
  }
}
