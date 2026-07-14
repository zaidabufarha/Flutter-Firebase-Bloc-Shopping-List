part of 'shop2_bloc.dart';

@freezed
class Shop2State with _$Shop2State {
  const factory Shop2State.loading() = Loading;
  const factory Shop2State.loaded(List<GroceryItem> list, bool hasReachedMax) =
      Loaded;
  const factory Shop2State.error(String message) = Error;
}
