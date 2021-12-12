import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModels.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: Colors.white,
        child: Icon(
          CupertinoIcons.cart,
          color: MyTheme.darkblue,
        ),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModels.items != null &&
                    CatalogModels.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            )),
      ),

      // appBar: AppBar(
      //   title: Text(
      //     'Catalog App...',
      //     style: GoogleFonts.pacifico(color: Colors.black, fontSize: 25),
      //   ),
      //   centerTitle: true,
      // ),
      //  drawer: MyDrawer(),
      // body: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child:
      //         (CatalogModels.items != null && CatalogModels.items!.isNotEmpty)
      //             ?
      // ListView.builder(
      //     itemCount: CatalogModels.items?.length,
      //     itemBuilder: (context, index) => ItemWidget(
      //       item: CatalogModels.items![index],
      //     ),
      //   )

      // GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         mainAxisSpacing: 15,
      //         crossAxisSpacing: 15),
      //     itemBuilder: (context, index) {
      //       final item = CatalogModels.items![index];
      //       return Card(
      //           clipBehavior: Clip.antiAlias,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10)),
      //           child: GridTile(
      //               header: Container(
      //                   padding: EdgeInsets.all(12),
      //                   decoration: BoxDecoration(
      //                     color: Colors.blue,
      //                   ),
      //                   child: Text(
      //                     item.name,
      //                     style: TextStyle(color: Colors.white),
      //                   )),
      //               footer: Text(item.price.toString()),
      //               child: Image.network(item.image)));
      //     },
      //     itemCount: CatalogModels.items!.length,
      //   )
      // : Center(child: CircularProgressIndicator())),
    );
  }
}
