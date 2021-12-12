import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModels.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModels.items[index];

        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.violet400.make(),
              10.heightBox,
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.xl.red500.make(),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor)),
                    onPressed: () {},
                    // icon: Icon(Icons.shopping_cart),
                    child: Text('Add to cart'),
                  ),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
