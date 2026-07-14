import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/bloc/shop2/shop2_bloc.dart';
import 'package:shopping/bloc/shoppinglist_bloc.dart';
import 'package:shopping/data/categories.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';
import 'package:shopping/widgets/listing.dart';
import 'package:shopping/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  //controller to call for more items when scrolled far enough
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      print('scrolled to end now loading more');
      final currentState = context.read<Shop2Bloc>().state;
      if (currentState is Loaded) {
        if (currentState.hasReachedMax) return;
      }
      context.read<Shop2Bloc>().add(Shop2Event.fetchList());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void Delete(GroceryItem item) async {
    context.read<Shop2Bloc>().add(Shop2Event.deleteItem(item));
  }

  void addItem() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewItem()));
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<Shop2Bloc, Shop2State>(
        //listener + whenornull works
        builder: (context, state) {
          return state.when(
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (list, hasReachedMax) => (list.isEmpty)
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
                    controller: scrollController,
                    itemCount: (hasReachedMax) ? list.length : list.length + 1,
                    itemBuilder: (ctx, index) => (index == list.length)
                        ? Center(child: CircularProgressIndicator())
                        : Dismissible(
                            key: ValueKey(list[index].id),
                            child: Listing(list[index]),
                            onDismissed: (direction) {
                              Delete(list[index]);
                            },
                          ),
                  ),
            error: (message) => Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
//futurebuilder is cool but not applicable here because its too dynamic