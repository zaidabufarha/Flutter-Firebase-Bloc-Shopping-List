import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/bloc/shoppinglist_bloc.dart';
import 'package:shopping/data/categories.dart';
import 'package:shopping/data/dummy_items.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery_item.dart';

import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  bool isSending = false;

  String name = '';
  int quantity = 1;
  Category? category;

  final formkey = GlobalKey<FormState>();

  void addItem() async {
    bool isValid = formkey.currentState!.validate();
    print('valid? $isValid');
    if (isValid) {
      formkey.currentState!.save();
      context.read<ShoppinglistBloc>().add(
        addItemEvent(name, quantity, category!),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
      ),
      body: (isSending)
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Form(
                key: formkey,
                child: Column(
                  //            mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      maxLength: 50,
                      decoration: InputDecoration(label: Text('Title')),
                      onSaved: (newValue) {
                        name = newValue!;
                      },
                      validator: (value) {
                        //validator is only for textFORMfield
                        //validator is only for textFORMfield
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length < 3) {
                          return 'Must be between 3-50 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              label: Text('Quantity'),
                            ),
                            initialValue: '1',
                            keyboardType: TextInputType.number,
                            onSaved: (newValue) {
                              quantity = int.parse(newValue!);
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  int.tryParse(value) == null ||
                                  int.tryParse(value)! < 1) {
                                return 'Must be a positive whole number';
                                return null;
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropdownButtonFormField(
                            initialValue: categories[Categories.other],
                            items: [
                              for (final category in categories.entries)
                                DropdownMenuItem(
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        color: category.value.color,
                                        width: 10,
                                        height: 10,
                                        margin: EdgeInsets.all(5),
                                      ),
                                      Text(category.value.name),
                                    ],
                                  ),
                                ),
                            ],
                            onChanged: (value) {
                              print(value!.name);
                            },
                            onSaved: (newValue) {
                              category = newValue!;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 30,
                      children: [
                        TextButton(
                          onPressed: (isSending)
                              ? null
                              : () {
                                  formkey.currentState!.reset();
                                },
                          child: Text('Reset'),
                        ),
                        ElevatedButton(
                          onPressed: (isSending) ? null : addItem,
                          child: Text('Add'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
