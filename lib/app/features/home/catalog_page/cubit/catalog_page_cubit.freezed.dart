// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatalogPageState {
  List<ItemInfoModel> get itemInfo => throw _privateConstructorUsedError;
  List<BrandModel> get brandsInfo => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatalogPageStateCopyWith<CatalogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogPageStateCopyWith<$Res> {
  factory $CatalogPageStateCopyWith(
          CatalogPageState value, $Res Function(CatalogPageState) then) =
      _$CatalogPageStateCopyWithImpl<$Res, CatalogPageState>;
  @useResult
  $Res call(
      {List<ItemInfoModel> itemInfo,
      List<BrandModel> brandsInfo,
      Status status,
      String errorMessage});
}

/// @nodoc
class _$CatalogPageStateCopyWithImpl<$Res, $Val extends CatalogPageState>
    implements $CatalogPageStateCopyWith<$Res> {
  _$CatalogPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemInfo = null,
    Object? brandsInfo = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      itemInfo: null == itemInfo
          ? _value.itemInfo
          : itemInfo // ignore: cast_nullable_to_non_nullable
              as List<ItemInfoModel>,
      brandsInfo: null == brandsInfo
          ? _value.brandsInfo
          : brandsInfo // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>,
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
abstract class _$$_CatalogPageStateCopyWith<$Res>
    implements $CatalogPageStateCopyWith<$Res> {
  factory _$$_CatalogPageStateCopyWith(
          _$_CatalogPageState value, $Res Function(_$_CatalogPageState) then) =
      __$$_CatalogPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemInfoModel> itemInfo,
      List<BrandModel> brandsInfo,
      Status status,
      String errorMessage});
}

/// @nodoc
class __$$_CatalogPageStateCopyWithImpl<$Res>
    extends _$CatalogPageStateCopyWithImpl<$Res, _$_CatalogPageState>
    implements _$$_CatalogPageStateCopyWith<$Res> {
  __$$_CatalogPageStateCopyWithImpl(
      _$_CatalogPageState _value, $Res Function(_$_CatalogPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemInfo = null,
    Object? brandsInfo = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_CatalogPageState(
      itemInfo: null == itemInfo
          ? _value._itemInfo
          : itemInfo // ignore: cast_nullable_to_non_nullable
              as List<ItemInfoModel>,
      brandsInfo: null == brandsInfo
          ? _value._brandsInfo
          : brandsInfo // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>,
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

class _$_CatalogPageState implements _CatalogPageState {
  const _$_CatalogPageState(
      {final List<ItemInfoModel> itemInfo = const [],
      final List<BrandModel> brandsInfo = const [],
      this.status = Status.initial,
      this.errorMessage = ''})
      : _itemInfo = itemInfo,
        _brandsInfo = brandsInfo;

  final List<ItemInfoModel> _itemInfo;
  @override
  @JsonKey()
  List<ItemInfoModel> get itemInfo {
    if (_itemInfo is EqualUnmodifiableListView) return _itemInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemInfo);
  }

  final List<BrandModel> _brandsInfo;
  @override
  @JsonKey()
  List<BrandModel> get brandsInfo {
    if (_brandsInfo is EqualUnmodifiableListView) return _brandsInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brandsInfo);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'CatalogPageState(itemInfo: $itemInfo, brandsInfo: $brandsInfo, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatalogPageState &&
            const DeepCollectionEquality().equals(other._itemInfo, _itemInfo) &&
            const DeepCollectionEquality()
                .equals(other._brandsInfo, _brandsInfo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemInfo),
      const DeepCollectionEquality().hash(_brandsInfo),
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CatalogPageStateCopyWith<_$_CatalogPageState> get copyWith =>
      __$$_CatalogPageStateCopyWithImpl<_$_CatalogPageState>(this, _$identity);
}

abstract class _CatalogPageState implements CatalogPageState {
  const factory _CatalogPageState(
      {final List<ItemInfoModel> itemInfo,
      final List<BrandModel> brandsInfo,
      final Status status,
      final String errorMessage}) = _$_CatalogPageState;

  @override
  List<ItemInfoModel> get itemInfo;
  @override
  List<BrandModel> get brandsInfo;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CatalogPageStateCopyWith<_$_CatalogPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
