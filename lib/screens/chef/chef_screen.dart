import 'package:flutter/material.dart';
import 'package:foodcosting/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ChefsScreen extends StatefulWidget {
  const ChefsScreen({Key? key}) : super(key: key);

  @override
  _ChefsScreenState createState() => _ChefsScreenState();
}

class _ChefsScreenState extends State<ChefsScreen> {
  String? currentMeal, ingredient1, quantity1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Preparations'),
        actions: [Icon(Icons.logout)],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi chef,',
              style:
                  GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.normal),
            ),
            Text(
              'Please select a meal and ingredients used',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: currentMeal,
              onChanged: (newMeal) => setState(() => currentMeal = newMeal),
              items: Constants.foodItems
                  .map(
                      (e) => DropdownMenuItem<String>(child: Text(e), value: e))
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Please pick a meal',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.orange),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ingridients',
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: ingredient1,
                    onChanged: (newIngredient) =>
                        setState(() => ingredient1 = newIngredient),
                    items: Constants.ingredients
                        .map((e) =>
                            DropdownMenuItem<String>(child: Text(e), value: e))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Ingridient',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.orange),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: quantity1,
                    onChanged: (newQuantity) =>
                        setState(() => quantity1 = newQuantity),
                    items: Constants.ingridientsQuantity
                        .map((e) =>
                            DropdownMenuItem<String>(child: Text(e), value: e))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.orange),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
