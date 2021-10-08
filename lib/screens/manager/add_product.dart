import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodcosting/models/product_model.dart';

// ignore: must_be_immutable
class AddProduct extends StatelessWidget {
  AddProduct({Key? key, this.itemName, this.itemPrice, this.itemQuantity})
      : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? itemName;
  int? itemPrice, itemQuantity;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  _additem() {
    final FormState? state = _formKey.currentState;

    if (state!.validate()) {
      state.save();
      final Product product = Product(
        itemName: itemName,
        itemPrice: itemPrice,
        itemQuantity: itemQuantity,
      );
      // print(product.toMap());
      firestore.collection('inventory').doc().set(product.toMap());
    }
    state.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Add Product'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Product name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onSaved: (String? value) {
                  itemName = value;
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please indicate the item name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Product price',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  itemPrice = int.parse(value!);
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please indicate the item price';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Product quantity',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
                onSaved: (String? value) {
                  itemQuantity = int.parse(value!);
                },
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please indicate the item quantity';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.orange,
                onPressed: _additem,
                child: Text('Add Item'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
