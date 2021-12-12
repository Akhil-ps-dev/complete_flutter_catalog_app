import 'package:flutter_catalog/models/items.dart';

class CartModel {
  //catalog field
  static final cartModel = CartModel._indernal();

  CartModel._indernal();
  factory CartModel() => cartModel;

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

//add item

  void add(Item item) {
    _itemIds.add(item.id);
  }

//remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
