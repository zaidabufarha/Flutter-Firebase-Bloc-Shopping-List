import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping/data/categories.dart';
import 'package:shopping/data/dummy_items.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';
import 'package:shopping/widgets/listing.dart';
import 'package:shopping/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  bool isLoading = true;
  String? error = null;

  void loadShoppingList() async {
    final url = Uri.https(
      'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    try {
      var response = await http.get(url);
      isLoading = false;

      if (response.body == 'null') {
        setState(() {
          print('only see this if the database is empty');
          error = 'No items in your shopping list yet, add some with +';
        });
        return;
      }

      if (response.statusCode >= 400) {
        setState(() {
          error = 'Failed to fetch data, try again later';
        });
        return;
      }
      Map<String, dynamic> receivedData = json.decode(response.body);
      List<GroceryItem> loadedList = [];

      for (final item in receivedData.entries) {
        Category category = categories.entries
            .firstWhere(
              (cat) => cat.value.name == item.value['category'],
            )
            .value;
        loadedList.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );

        setState(() {
          shoppingList = loadedList;
        });
      }
    } catch (err) {
      setState(() {
        error = 'Something went wrong, error code: $err';
      });
    }
  }

  void Delete(int index) async {
    final url = Uri.https(
      'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
      'shopping-list/${shoppingList[index].id}.json',
    );
    final response = await http.delete(url);
    if (response.statusCode < 400) {
      setState(() {
        shoppingList.removeAt(index);
      });
      print('Successfully deleted index $index');
    }
  }

  @override
  void initState() {
    loadShoppingList();
    super.initState();
  }

  List<GroceryItem> shoppingList = [];
  void addItem() async {
    GroceryItem? newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));

    if (newItem != null) {
      setState(() {
        shoppingList.add(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (isLoading) {
      content = Center(child: CircularProgressIndicator());
    } else {
      content = (shoppingList.length == 0)
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'No items in your shopping list yet, add some with +',
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              itemCount: shoppingList.length,
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(shoppingList[index].id),
                child: Listing(shoppingList[index]),
                onDismissed: (direction) {
                  Delete(index);
                },
              ),
            );
    }

    if (error != null) {
      content = Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            error!,
            style: TextStyle(fontSize: 50),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: addItem,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
