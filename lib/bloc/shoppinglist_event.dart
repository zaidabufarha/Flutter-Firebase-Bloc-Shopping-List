part of 'shoppinglist_bloc.dart';

sealed class ShoppinglistEvent extends Equatable {
  const ShoppinglistEvent();

  @override
  List<Object> get props => [];
}

class fetchListEvent extends ShoppinglistEvent {}

class deleteItemEvent extends ShoppinglistEvent {
  GroceryItem item;
  deleteItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class addItemEvent extends ShoppinglistEvent {
  String name;
  int quantity;
  Category category;
  addItemEvent(this.name, this.quantity, this.category);

  @override
  List<Object> get props => [name, quantity, category];
}
