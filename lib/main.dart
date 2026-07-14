import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/bloc/shop2/shop2_bloc.dart';
import 'package:shopping/bloc/shoppinglist_bloc.dart';
import 'package:shopping/grocery_list.dart';
import 'package:shopping/helpers/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create: (context) => ShoppinglistBloc()..add(fetchListEvent()),
      create: (context) => Shop2Bloc()..add(Shop2Event.fetchList()),
      child: MaterialApp(
        title: 'Flutter Groceries',
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 229, 250),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 42, 51, 59),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
        ),
        home: GroceryList(),
      ),
    );
  }
}
