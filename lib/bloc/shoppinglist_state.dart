part of 'shoppinglist_bloc.dart';

sealed class ShoppinglistState extends Equatable {
  const ShoppinglistState();

  @override
  List<Object> get props => [];
}

final class ShoppinglistLoading extends ShoppinglistState {}

final class ShoppinglistError extends ShoppinglistState {
  final String message;

  ShoppinglistError(this.message);

  @override
  List<Object> get props => [message];
}

final class ShoppinglistLoaded extends ShoppinglistState {
  final List<GroceryItem> list;

  ShoppinglistLoaded(this.list);

  @override
  List<Object> get props => [list];
}
