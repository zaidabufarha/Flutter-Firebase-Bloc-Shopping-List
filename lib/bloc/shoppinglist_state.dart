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
  final bool hasReachedMax;
  final int startIndex;

  const ShoppinglistLoaded({
    required this.list,
    this.hasReachedMax = false,
    this.startIndex = 0,
  });

  ShoppinglistLoaded copyWith({
    List<GroceryItem>? list,
    bool? hasReachedMax,
  }) {
    return ShoppinglistLoaded(
      list: list ?? this.list,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [list, hasReachedMax];
}
