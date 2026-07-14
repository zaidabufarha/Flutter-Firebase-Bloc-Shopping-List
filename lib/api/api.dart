import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping/bloc/shoppinglist_bloc.dart';
import 'package:shopping/data/categories.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';

Future<List<GroceryItem>?> fetchFromDatabase(String? lastItemId) async {
  //need query params because if lastitemid is null everything is cooked
  final Map<String, String> queryParams = {
    'orderBy': r'"$key"',
    'limitToFirst': '20',
  };

  if (lastItemId != null) {
    queryParams['startAt'] = '"$lastItemId"';
  }

  final url = Uri.https(
    'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
    '/shopping-list.json',
    queryParams,
  );
  //String error = '';
  var response = await http.get(url);

  if (response.body == 'null') {
    //print('only see this if the database is empty');
    //error = 'No items in your shopping list yet, add some with +';
    //emit(ShoppinglistError(error));
    return null;
  }

  if (response.statusCode >= 400) {
    //error = 'Failed to fetch data, try again later';
    //emit(ShoppinglistError(error));
    return null;
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
  }
  return loadedList;
}
