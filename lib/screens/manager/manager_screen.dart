import 'package:flutter/material.dart';
import 'package:foodcosting/screens/manager/manager.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Food Costing'),
            bottom: TabBar(
              tabs: [Tab(text: 'Inventory'), Tab(text: 'Profit margins')],
            ),
          ),
          body: TabBarView(children: [FoodCosting(), ProfitMargins()]),
        ));
  }
}
