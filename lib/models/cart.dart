import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/items.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field

  late CatalogModels _catalog;
  //Collection of IDs- store ids of each items

  final List<int> _itemIds = [];
//get catalog
  CatalogModels get catalog => _catalog;
  set catalog(CatalogModels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//Get items in te cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get totoal price;

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);


//remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}
