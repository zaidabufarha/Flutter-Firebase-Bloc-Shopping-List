import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/api/api.dart';
import 'package:shopping/data/categories.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';
import 'package:shopping/grocery_list.dart';
import 'package:http/http.dart' as http;

part 'shoppinglist_event.dart';
part 'shoppinglist_state.dart';

class ShoppinglistBloc extends Bloc<ShoppinglistEvent, ShoppinglistState> {
  bool fetching = false;
  String? lastItemId;
  ShoppinglistBloc() : super(ShoppinglistLoading()) {
    on<fetchListEvent>((event, emit) async {
      if (state is ShoppinglistLoaded) {
        final currentState = state as ShoppinglistLoaded;
        if (currentState.hasReachedMax || fetching) return;
        if (currentState.list.isNotEmpty) {
          lastItemId = currentState.list.last.id;
        }
      }
      fetching = true;
      // while it is initialized writing it here ensures that it works on future loads not just the first

      List<GroceryItem>? loadedList;
      try {
        loadedList = await fetchFromDatabase(
          lastItemId,
        );
      } catch (err) {
        emit(ShoppinglistError('Something went wrong, error code: $err'));
        return;
      }
      fetching = false;
      if (loadedList == null) {
        if (state is ShoppinglistLoaded) {
          final currentState = state as ShoppinglistLoaded;
          emit(currentState.copyWith(hasReachedMax: true));
        } else {
          emit(
            ShoppinglistLoaded(list: [], hasReachedMax: false, startIndex: 0),
          );
        }
        return;
      }
      //if there wasnt a full load of 20
      if (loadedList.length < 20) {
        if (state is ShoppinglistLoaded) {
          final currentState = state as ShoppinglistLoaded;
          emit(
            currentState.copyWith(
              hasReachedMax: true,
              list: [...currentState.list, ...loadedList],
            ),
          );
        } else {
          emit(
            ShoppinglistLoaded(
              list: loadedList,
              startIndex: loadedList.length,
              hasReachedMax: true,
            ),
          );
        }
      } else {
        //full package
        if (state is ShoppinglistLoaded) {
          final currentState = state as ShoppinglistLoaded;
          emit(
            currentState.copyWith(
              hasReachedMax: false,
              list: [...currentState.list, ...loadedList],
            ),
          );
        } else {
          emit(
            ShoppinglistLoaded(
              list: loadedList,
              startIndex: 20,
              hasReachedMax: false,
            ),
          );
        }
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
        emit(
          currentState.copyWith(
            list: newList,
          ),
        );
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
        emit(
          currentState.copyWith(
            list: newList,
          ),
        );
      }
    });
  }
}
