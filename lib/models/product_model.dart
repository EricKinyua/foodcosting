import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({
    this.itemName,
    this.itemPrice,
    this.itemQuantity,
  });

  String? itemName;
  int? itemPrice;
  int? itemQuantity;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        itemName: json["itemName"] == null ? null : json["itemName"],
        itemPrice: json["itemPrice"] == null ? null : json["itemPrice"],
        itemQuantity:
            json["itemQuantity"] == null ? null : json["itemQuantity"],
      );

  Map<String, dynamic> toMap() => {
        "itemName": itemName == null ? null : itemName,
        "itemPrice": itemPrice == null ? null : itemPrice,
        "itemQuantity": itemQuantity == null ? null : itemQuantity,
      };
}
