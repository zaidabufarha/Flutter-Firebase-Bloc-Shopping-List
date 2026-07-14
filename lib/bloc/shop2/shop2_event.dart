part of 'shop2_bloc.dart';

@freezed
class Shop2Event with _$Shop2Event {
  const factory Shop2Event.fetchList() = _FetchList;
  const factory Shop2Event.addItem(
    String name,
    int quantity,
    Category category,
  ) = _addItem;
  const factory Shop2Event.deleteItem(GroceryItem item) = _deleteItem;
}
