import 'package:flutter/material.dart';
import 'package:shopping/models/grocery_item.dart';

class Listing extends StatelessWidget {
  Listing(this.data, {super.key});
  GroceryItem data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(color: data.category.color),
            child: SizedBox(
              width: 30,
              height: 30,
            ),
          ),
          Text(
            data.name,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 1,
          ),
          SizedBox(
            width: 1,
          ),
          SizedBox(
            width: 1,
          ),
          Text(
            data.quantity.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
