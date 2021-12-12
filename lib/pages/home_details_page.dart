import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  const HomeDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: Vx.mH8,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl4.red500.make(),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor)),
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to cart'),
            ).wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 40.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyTheme.lightblue)
                          .bold
                          .make(),
                      catalog.desc.text.xl.violet400.make(),
                      5.heightBox,
                      "Eirmod rebum clita sed vero voluptua voluptua diam accusam, Stet aliquyam dolor labore rebum erat. Sed eirmod elitr voluptua lorem."
                          .text
                          .medium
                          .make()
                          .p16()

                      //  .scale0()
                    ],
                  ).py64()),
            ))
          ],
        ).p16(),
      ),
    );
  }
}
