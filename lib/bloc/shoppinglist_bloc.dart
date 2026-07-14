import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/data/categories.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';
import 'package:shopping/grocery_list.dart';
import 'package:http/http.dart' as http;

part 'shoppinglist_event.dart';
part 'shoppinglist_state.dart';

class ShoppinglistBloc extends Bloc<ShoppinglistEvent, ShoppinglistState> {
  ShoppinglistBloc() : super(ShoppinglistLoading()) {
    on<fetchListEvent>((event, emit) async {
      //if check for event is unneccessary
      emit(ShoppinglistLoading());
      // while it is initialized writing it here ensures that it works on future loads not just the first
      final url = Uri.https(
        'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
        'shopping-list.json',
      );
      String error = '';
      try {
        var response = await http.get(url);

        if (response.body == 'null') {
          print('only see this if the database is empty');
          error = 'No items in your shopping list yet, add some with +';
          emit(ShoppinglistError(error));
          return;
        }

        if (response.statusCode >= 400) {
          error = 'Failed to fetch data, try again later';
          emit(ShoppinglistError(error));
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
        }
        emit(ShoppinglistLoaded(loadedList));
      } catch (err) {
        error = 'Something went wrong, error code: $err';
        emit(ShoppinglistError(error));
        return;
      }
    });
    on<deleteItemEvent>((event, emit) async {
      final url = Uri.https(
        'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
        'shopping-list/${event.item.id}.json',
      );
      final response = await http.delete(url);
      if (response.statusCode < 400 && state is ShoppinglistLoaded) {
        final currentState = state as ShoppinglistLoaded;
        List<GroceryItem> newList = currentState.list
            .where((i) => i != event.item)
            .toList();
        print('Successfully deleted ${event.item.name}');
        emit(ShoppinglistLoaded(newList));
      } else {
        return;
      }
    });

    on<addItemEvent>((event, emit) async {
      final url = Uri.https(
        'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
        'shopping-list.json',
      );
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': event.name,
          'quantity': event.quantity,
          'category': event.category.name,
        }),
      );
      print(response.statusCode);
      //print(        'name $name quantity ${quantity.toString()} category ${category!.name}',);
      final Map<String, dynamic> responseData = json.decode(response.body);

      GroceryItem newItem = GroceryItem(
        id: responseData['name'],
        name: event.name,
        quantity: event.quantity,
        category: event.category,
      );
      if (response.statusCode < 400 && state is ShoppinglistLoaded) {
        final currentState = state as ShoppinglistLoaded;
        List<GroceryItem> newList = [...currentState.list, newItem];
        emit(ShoppinglistLoaded(newList));
      }
    });
  }
}
