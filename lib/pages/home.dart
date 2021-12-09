import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 30;
  String name = "kottayam123";

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModels.items != null &&
                    CatalogModels.items!.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ecommerce App",
            style:
                GoogleFonts.pacifico(fontSize: 25, color: (MyTheme.darkblue))),
        "Trending Products".text.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModels.items!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModels.items![index];

          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkblue).bold.make(),
              catalog.desc.text.violet400.make(),
              ButtonBar(
                buttonPadding: Vx.mH8,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.xl.red500.make(),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkblue)),
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Buy'),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
