// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemInfoModel _$ItemInfoModelFromJson(Map<String, dynamic> json) {
  return _ItemInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ItemInfoModel {
  String get itemType => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemInfoModelCopyWith<ItemInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemInfoModelCopyWith<$Res> {
  factory $ItemInfoModelCopyWith(
          ItemInfoModel value, $Res Function(ItemInfoModel) then) =
      _$ItemInfoModelCopyWithImpl<$Res, ItemInfoModel>;
  @useResult
  $Res call({String itemType, String image, String description});
}

/// @nodoc
class _$ItemInfoModelCopyWithImpl<$Res, $Val extends ItemInfoModel>
    implements $ItemInfoModelCopyWith<$Res> {
  _$ItemInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemType = null,
    Object? image = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemInfoModelCopyWith<$Res>
    implements $ItemInfoModelCopyWith<$Res> {
  factory _$$_ItemInfoModelCopyWith(
          _$_ItemInfoModel value, $Res Function(_$_ItemInfoModel) then) =
      __$$_ItemInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String itemType, String image, String description});
}

/// @nodoc
class __$$_ItemInfoModelCopyWithImpl<$Res>
    extends _$ItemInfoModelCopyWithImpl<$Res, _$_ItemInfoModel>
    implements _$$_ItemInfoModelCopyWith<$Res> {
  __$$_ItemInfoModelCopyWithImpl(
      _$_ItemInfoModel _value, $Res Function(_$_ItemInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemType = null,
    Object? image = null,
    Object? description = null,
  }) {
    return _then(_$_ItemInfoModel(
      null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String,
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ItemInfoModel implements _ItemInfoModel {
  _$_ItemInfoModel(this.itemType, this.image, this.description);

  factory _$_ItemInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ItemInfoModelFromJson(json);

  @override
  final String itemType;
  @override
  final String image;
  @override
  final String description;

  @override
  String toString() {
    return 'ItemInfoModel(itemType: $itemType, image: $image, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemInfoModel &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemType, image, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemInfoModelCopyWith<_$_ItemInfoModel> get copyWith =>
      __$$_ItemInfoModelCopyWithImpl<_$_ItemInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemInfoModelToJson(
      this,
    );
  }
}

abstract class _ItemInfoModel implements ItemInfoModel {
  factory _ItemInfoModel(
          final String itemType, final String image, final String description) =
      _$_ItemInfoModel;

  factory _ItemInfoModel.fromJson(Map<String, dynamic> json) =
      _$_ItemInfoModel.fromJson;

  @override
  String get itemType;
  @override
  String get image;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ItemInfoModelCopyWith<_$_ItemInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
