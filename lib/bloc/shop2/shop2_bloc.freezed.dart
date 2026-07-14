// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop2_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Shop2State {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shop2State);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Shop2State()';
}


}

/// @nodoc
class $Shop2StateCopyWith<$Res>  {
$Shop2StateCopyWith(Shop2State _, $Res Function(Shop2State) __);
}


/// Adds pattern-matching-related methods to [Shop2State].
extension Shop2StatePatterns on Shop2State {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<GroceryItem> list,  bool hasReachedMax)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.list,_that.hasReachedMax);case Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<GroceryItem> list,  bool hasReachedMax)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Loading():
return loading();case Loaded():
return loaded(_that.list,_that.hasReachedMax);case Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<GroceryItem> list,  bool hasReachedMax)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.list,_that.hasReachedMax);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Loading implements Shop2State {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Shop2State.loading()';
}


}




/// @nodoc


class Loaded implements Shop2State {
  const Loaded(final  List<GroceryItem> list, this.hasReachedMax): _list = list;
  

 final  List<GroceryItem> _list;
 List<GroceryItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}

 final  bool hasReachedMax;

/// Create a copy of Shop2State
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._list, _list)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list),hasReachedMax);

@override
String toString() {
  return 'Shop2State.loaded(list: $list, hasReachedMax: $hasReachedMax)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $Shop2StateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<GroceryItem> list, bool hasReachedMax
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of Shop2State
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,Object? hasReachedMax = null,}) {
  return _then(Loaded(
null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<GroceryItem>,null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class Error implements Shop2State {
  const Error(this.message);
  

 final  String message;

/// Create a copy of Shop2State
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Shop2State.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $Shop2StateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of Shop2State
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Shop2Event {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shop2Event);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Shop2Event()';
}


}

/// @nodoc
class $Shop2EventCopyWith<$Res>  {
$Shop2EventCopyWith(Shop2Event _, $Res Function(Shop2Event) __);
}


/// Adds pattern-matching-related methods to [Shop2Event].
extension Shop2EventPatterns on Shop2Event {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchList value)?  fetchList,TResult Function( _addItem value)?  addItem,TResult Function( _deleteItem value)?  deleteItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList(_that);case _addItem() when addItem != null:
return addItem(_that);case _deleteItem() when deleteItem != null:
return deleteItem(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchList value)  fetchList,required TResult Function( _addItem value)  addItem,required TResult Function( _deleteItem value)  deleteItem,}){
final _that = this;
switch (_that) {
case _FetchList():
return fetchList(_that);case _addItem():
return addItem(_that);case _deleteItem():
return deleteItem(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchList value)?  fetchList,TResult? Function( _addItem value)?  addItem,TResult? Function( _deleteItem value)?  deleteItem,}){
final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList(_that);case _addItem() when addItem != null:
return addItem(_that);case _deleteItem() when deleteItem != null:
return deleteItem(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchList,TResult Function( String name,  int quantity,  Category category)?  addItem,TResult Function( GroceryItem item)?  deleteItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList();case _addItem() when addItem != null:
return addItem(_that.name,_that.quantity,_that.category);case _deleteItem() when deleteItem != null:
return deleteItem(_that.item);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchList,required TResult Function( String name,  int quantity,  Category category)  addItem,required TResult Function( GroceryItem item)  deleteItem,}) {final _that = this;
switch (_that) {
case _FetchList():
return fetchList();case _addItem():
return addItem(_that.name,_that.quantity,_that.category);case _deleteItem():
return deleteItem(_that.item);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchList,TResult? Function( String name,  int quantity,  Category category)?  addItem,TResult? Function( GroceryItem item)?  deleteItem,}) {final _that = this;
switch (_that) {
case _FetchList() when fetchList != null:
return fetchList();case _addItem() when addItem != null:
return addItem(_that.name,_that.quantity,_that.category);case _deleteItem() when deleteItem != null:
return deleteItem(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _FetchList implements Shop2Event {
  const _FetchList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Shop2Event.fetchList()';
}


}




/// @nodoc


class _addItem implements Shop2Event {
  const _addItem(this.name, this.quantity, this.category);
  

 final  String name;
 final  int quantity;
 final  Category category;

/// Create a copy of Shop2Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$addItemCopyWith<_addItem> get copyWith => __$addItemCopyWithImpl<_addItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _addItem&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantity,category);

@override
String toString() {
  return 'Shop2Event.addItem(name: $name, quantity: $quantity, category: $category)';
}


}

/// @nodoc
abstract mixin class _$addItemCopyWith<$Res> implements $Shop2EventCopyWith<$Res> {
  factory _$addItemCopyWith(_addItem value, $Res Function(_addItem) _then) = __$addItemCopyWithImpl;
@useResult
$Res call({
 String name, int quantity, Category category
});




}
/// @nodoc
class __$addItemCopyWithImpl<$Res>
    implements _$addItemCopyWith<$Res> {
  __$addItemCopyWithImpl(this._self, this._then);

  final _addItem _self;
  final $Res Function(_addItem) _then;

/// Create a copy of Shop2Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? quantity = null,Object? category = null,}) {
  return _then(_addItem(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,
  ));
}


}

/// @nodoc


class _deleteItem implements Shop2Event {
  const _deleteItem(this.item);
  

 final  GroceryItem item;

/// Create a copy of Shop2Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$deleteItemCopyWith<_deleteItem> get copyWith => __$deleteItemCopyWithImpl<_deleteItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _deleteItem&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'Shop2Event.deleteItem(item: $item)';
}


}

/// @nodoc
abstract mixin class _$deleteItemCopyWith<$Res> implements $Shop2EventCopyWith<$Res> {
  factory _$deleteItemCopyWith(_deleteItem value, $Res Function(_deleteItem) _then) = __$deleteItemCopyWithImpl;
@useResult
$Res call({
 GroceryItem item
});




}
/// @nodoc
class __$deleteItemCopyWithImpl<$Res>
    implements _$deleteItemCopyWith<$Res> {
  __$deleteItemCopyWithImpl(this._self, this._then);

  final _deleteItem _self;
  final $Res Function(_deleteItem) _then;

/// Create a copy of Shop2Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_deleteItem(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as GroceryItem,
  ));
}


}

// dart format on
