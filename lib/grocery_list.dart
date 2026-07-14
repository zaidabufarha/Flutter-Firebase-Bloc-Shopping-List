import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        scrollController.position.maxScrollExtent - 100) {
      print('scrolled to end now loading more');
      final currentState = context.read<ShoppinglistBloc>().state;
      if (currentState is ShoppinglistLoaded) {
        if (currentState.hasReachedMax) return;
      }
      context.read<ShoppinglistBloc>().add(fetchListEvent());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void Delete(GroceryItem item) async {
    context.read<ShoppinglistBloc>().add(deleteItemEvent(item));
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
      body: BlocBuilder<ShoppinglistBloc, ShoppinglistState>(
        builder: (context, state) {
          if (state is ShoppinglistLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ShoppinglistError) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  state.message,
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (state is ShoppinglistLoaded) {
            return (state.list.isEmpty)
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
                    itemCount: (state.hasReachedMax)
                        ? state.list.length
                        : state.list.length + 1,
                    itemBuilder: (ctx, index) => (index == state.list.length)
                        ? Center(child: CircularProgressIndicator())
                        : Dismissible(
                            key: ValueKey(state.list[index].id),
                            child: Listing(state.list[index]),
                            onDismissed: (direction) {
                              Delete(state.list[index]);
                            },
                          ),
                  );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
//futurebuilder is cool but not applicable here because its too dynamic