// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemDetailsState {
  ItemModel? get itemDetailsModel => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemDetailsStateCopyWith<ItemDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailsStateCopyWith<$Res> {
  factory $ItemDetailsStateCopyWith(
          ItemDetailsState value, $Res Function(ItemDetailsState) then) =
      _$ItemDetailsStateCopyWithImpl<$Res, ItemDetailsState>;
  @useResult
  $Res call({ItemModel? itemDetailsModel, Status status, String? errorMessage});
}

/// @nodoc
class _$ItemDetailsStateCopyWithImpl<$Res, $Val extends ItemDetailsState>
    implements $ItemDetailsStateCopyWith<$Res> {
  _$ItemDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemDetailsModel = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      itemDetailsModel: freezed == itemDetailsModel
          ? _value.itemDetailsModel
          : itemDetailsModel // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemDetailsStateCopyWith<$Res>
    implements $ItemDetailsStateCopyWith<$Res> {
  factory _$$_ItemDetailsStateCopyWith(
          _$_ItemDetailsState value, $Res Function(_$_ItemDetailsState) then) =
      __$$_ItemDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ItemModel? itemDetailsModel, Status status, String? errorMessage});
}

/// @nodoc
class __$$_ItemDetailsStateCopyWithImpl<$Res>
    extends _$ItemDetailsStateCopyWithImpl<$Res, _$_ItemDetailsState>
    implements _$$_ItemDetailsStateCopyWith<$Res> {
  __$$_ItemDetailsStateCopyWithImpl(
      _$_ItemDetailsState _value, $Res Function(_$_ItemDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemDetailsModel = freezed,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_ItemDetailsState(
      itemDetailsModel: freezed == itemDetailsModel
          ? _value.itemDetailsModel
          : itemDetailsModel // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ItemDetailsState implements _ItemDetailsState {
  const _$_ItemDetailsState(
      {this.itemDetailsModel, this.status = Status.initial, this.errorMessage});

  @override
  final ItemModel? itemDetailsModel;
  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ItemDetailsState(itemDetailsModel: $itemDetailsModel, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemDetailsState &&
            (identical(other.itemDetailsModel, itemDetailsModel) ||
                other.itemDetailsModel == itemDetailsModel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, itemDetailsModel, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemDetailsStateCopyWith<_$_ItemDetailsState> get copyWith =>
      __$$_ItemDetailsStateCopyWithImpl<_$_ItemDetailsState>(this, _$identity);
}

abstract class _ItemDetailsState implements ItemDetailsState {
  const factory _ItemDetailsState(
      {final ItemModel? itemDetailsModel,
      final Status status,
      final String? errorMessage}) = _$_ItemDetailsState;

  @override
  ItemModel? get itemDetailsModel;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_ItemDetailsStateCopyWith<_$_ItemDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
