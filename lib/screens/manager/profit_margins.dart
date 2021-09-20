import 'package:flutter/material.dart';

class ProfitMargins extends StatelessWidget {
  const ProfitMargins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Food Item'),
              Text('Production Cost'),
              Text('Selling Price'),
              Text('Profit'),
            ],
          ),
          globalProfitCard('Ugali skuma', '60', '100', '40'),
          globalProfitCard('Chapo ndengu', '70', '120', '50'),
        ],
      ),
    );
  }

  Card globalProfitCard(
    String? foodItem,
    String? productionCost,
    String? sellingPrice,
    String? profit,
  ) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(foodItem!),
            Text(productionCost!),
            Text(sellingPrice!),
            Text(profit!),
          ],
        ),
      ),
    );
  }
}
