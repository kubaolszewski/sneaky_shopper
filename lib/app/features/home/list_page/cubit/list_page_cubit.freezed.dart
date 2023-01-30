// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListPageState {
  List<ItemModel> get items => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListPageStateCopyWith<ListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListPageStateCopyWith<$Res> {
  factory $ListPageStateCopyWith(
          ListPageState value, $Res Function(ListPageState) then) =
      _$ListPageStateCopyWithImpl<$Res, ListPageState>;
  @useResult
  $Res call({List<ItemModel> items, Status status, String errorMessage});
}

/// @nodoc
class _$ListPageStateCopyWithImpl<$Res, $Val extends ListPageState>
    implements $ListPageStateCopyWith<$Res> {
  _$ListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListPageStateCopyWith<$Res>
    implements $ListPageStateCopyWith<$Res> {
  factory _$$_ListPageStateCopyWith(
          _$_ListPageState value, $Res Function(_$_ListPageState) then) =
      __$$_ListPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ItemModel> items, Status status, String errorMessage});
}

/// @nodoc
class __$$_ListPageStateCopyWithImpl<$Res>
    extends _$ListPageStateCopyWithImpl<$Res, _$_ListPageState>
    implements _$$_ListPageStateCopyWith<$Res> {
  __$$_ListPageStateCopyWithImpl(
      _$_ListPageState _value, $Res Function(_$_ListPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_ListPageState(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ListPageState implements _ListPageState {
  const _$_ListPageState(
      {final List<ItemModel> items = const [],
      this.status = Status.initial,
      this.errorMessage = ''})
      : _items = items;

  final List<ItemModel> _items;
  @override
  @JsonKey()
  List<ItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'ListPageState(items: $items, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListPageState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListPageStateCopyWith<_$_ListPageState> get copyWith =>
      __$$_ListPageStateCopyWithImpl<_$_ListPageState>(this, _$identity);
}

abstract class _ListPageState implements ListPageState {
  const factory _ListPageState(
      {final List<ItemModel> items,
      final Status status,
      final String errorMessage}) = _$_ListPageState;

  @override
  List<ItemModel> get items;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ListPageStateCopyWith<_$_ListPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
