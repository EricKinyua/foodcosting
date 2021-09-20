import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodcosting/screens/manager/manager.dart';

class FoodCosting extends StatefulWidget {
  const FoodCosting({Key? key}) : super(key: key);

  @override
  _FoodCostingState createState() => _FoodCostingState();
}

class _FoodCostingState extends State<FoodCosting> {
  void add(String docId) async {
    await firestore.collection('inventory').doc(docId).update({
      'itemQuantity': FieldValue.increment(1),
    });
  }

  void minus(String docId) async {
    await firestore.collection('inventory').doc(docId).update({
      'itemQuantity': FieldValue.increment(-1),
    });
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text('Items'),
              Spacer(),
              Text('Quantity'),
            ],
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('inventory').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    //print(snapshot.data!.docs[index].data());
                    String itemName =
                        snapshot.data!.docs[index].get('itemName');
                    String itemQuantity = snapshot.data!.docs[index]
                        .get('itemQuantity')
                        .toString();
                    String docId = snapshot.data!.docs[index].id;
                    return globalItemCard(itemName, itemQuantity, docId);
                  },
                );
              },
            ),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddProduct())),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Card globalItemCard(String? itemName, String? itemQuantity, String? docId) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
        child: Row(
          children: [
            Text(itemName!),
            Spacer(),
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () => minus(docId!),
                    child: Icon(Icons.remove),
                  ),
                  Text(itemQuantity!),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () => add(docId!),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
