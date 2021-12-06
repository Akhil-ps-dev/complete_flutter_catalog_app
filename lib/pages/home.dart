import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
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
        title: Text(
          'Catalog App...',
          style: GoogleFonts.pacifico(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: CatalogModels.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogModels.items[index],
              );
            }),
      ),
    );
  }
}
