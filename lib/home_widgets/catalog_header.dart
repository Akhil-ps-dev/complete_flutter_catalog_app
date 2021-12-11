import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
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
