import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/api/api.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';

part 'shop2_state.dart';
part 'shop2_event.dart';
part 'shop2_bloc.freezed.dart';

class Shop2Bloc extends Bloc<Shop2Event, Shop2State> {
  bool fetching = false;
  String? lastItemId;
  Shop2Bloc() : super(const Shop2State.loading()) {
    on<Shop2Event>((event, emit) async {
      await event.when(
        fetchList: () async {
          if (state is Loaded) {
            final currentState = state as Loaded;
            if (currentState.hasReachedMax || fetching) return;
            if (currentState.list.isNotEmpty) {
              lastItemId = currentState.list.last.id;
            }
          }
          fetching = true;
          List<GroceryItem>? loadedList;
          try {
            loadedList = await fetchFromDatabase(
              lastItemId,
            );
          } catch (err) {
            emit(Error('Something went wrong, error code: $err'));
            return;
          }
          fetching = false;
          if (loadedList == null) {
            if (state is Loaded) {
              final currentState = state as Loaded;
              emit(currentState.copyWith(hasReachedMax: true));
            } else {
              emit(
                Loaded([], false),
              );
            }
            return;
          }
          //if there wasnt a full load of 20
          if (loadedList.length < 20) {
            if (state is Loaded) {
              final currentState = state as Loaded;
              emit(
                currentState.copyWith(
                  hasReachedMax: true,
                  list: [...currentState.list, ...loadedList],
                ),
              );
            } else {
              emit(
                Loaded(
                  loadedList,
                  true,
                ),
              );
            }
          } else {
            //full package
            if (state is Loaded) {
              final currentState = state as Loaded;
              emit(
                currentState.copyWith(
                  hasReachedMax: false,
                  list: [...currentState.list, ...loadedList],
                ),
              );
            } else {
              emit(
                Loaded(
                  loadedList,
                  false,
                ),
              );
            }
          }
        },
        addItem: (name, quantity, category) async {
          final url = Uri.https(
            'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
            'shopping-list.json',
          );
          final response = await http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'name': name,
              'quantity': quantity,
              'category': category.name,
            }),
          );
          //print(response.statusCode);
          //print(        'name $name quantity ${quantity.toString()} category ${category!.name}',);
          final Map<String, dynamic> responseData = json.decode(response.body);

          GroceryItem newItem = GroceryItem(
            id: responseData['name'],
            name: name,
            quantity: quantity,
            category: category,
          );
          if (response.statusCode < 400 && state is Loaded) {
            final currentState = state as Loaded;
            List<GroceryItem> newList = [...currentState.list, newItem];
            emit(
              currentState.copyWith(
                list: newList,
              ),
            );
          }
        },
        deleteItem: (item) async {
          final url = Uri.https(
            'shoppinglist-c8dd5-default-rtdb.firebaseio.com',
            'shopping-list/${item.id}.json',
          );
          final response = await http.delete(url);
          if (response.statusCode < 400 && state is Loaded) {
            final currentState = state as Loaded;
            List<GroceryItem> newList = currentState.list
                .where((i) => i != item)
                .toList();
            print('Successfully deleted ${item.name}');
            emit(
              currentState.copyWith(
                list: newList,
              ),
            );
          } else {
            return;
          }
        },
      );
    });
  }
}
