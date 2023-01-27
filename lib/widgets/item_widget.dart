import 'package:division/division.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Image.asset(
              item.image,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Txt(
                    item.name,
                    style: TxtStyle()
                      ..margin(right: 110)
                      ..fontSize(12),
                  ),
                  Txt(
                    item.desc,
                    style: TxtStyle()
                      ..fontSize(12)
                      ..margin(bottom: 8),
                  ),
                  Txt(
                    "\$${item.price}",
                    style: TxtStyle()..margin(right: 116),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
