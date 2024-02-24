// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_sneaker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleSneakerModel _$SingleSneakerModelFromJson(Map<String, dynamic> json) {
  return _SingleSneakerModel.fromJson(json);
}

/// @nodoc
mixin _$SingleSneakerModel {
  String get id => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get colorway => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get silhouette => throw _privateConstructorUsedError;
  String get releaseYear => throw _privateConstructorUsedError;
  DateTime get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'retailPrice')
  int get price => throw _privateConstructorUsedError;
  int get estimatedMarketValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'story')
  String? get description => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;
  Links get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleSneakerModelCopyWith<SingleSneakerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleSneakerModelCopyWith<$Res> {
  factory $SingleSneakerModelCopyWith(
          SingleSneakerModel value, $Res Function(SingleSneakerModel) then) =
      _$SingleSneakerModelCopyWithImpl<$Res, SingleSneakerModel>;
  @useResult
  $Res call(
      {String id,
      String sku,
      String brand,
      String name,
      String colorway,
      String gender,
      String silhouette,
      String releaseYear,
      DateTime releaseDate,
      @JsonKey(name: 'retailPrice') int price,
      int estimatedMarketValue,
      @JsonKey(name: 'story') String? description,
      Image image,
      Links links});

  $ImageCopyWith<$Res> get image;
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class _$SingleSneakerModelCopyWithImpl<$Res, $Val extends SingleSneakerModel>
    implements $SingleSneakerModelCopyWith<$Res> {
  _$SingleSneakerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? brand = null,
    Object? name = null,
    Object? colorway = null,
    Object? gender = null,
    Object? silhouette = null,
    Object? releaseYear = null,
    Object? releaseDate = null,
    Object? price = null,
    Object? estimatedMarketValue = null,
    Object? description = freezed,
    Object? image = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorway: null == colorway
          ? _value.colorway
          : colorway // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      silhouette: null == silhouette
          ? _value.silhouette
          : silhouette // ignore: cast_nullable_to_non_nullable
              as String,
      releaseYear: null == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedMarketValue: null == estimatedMarketValue
          ? _value.estimatedMarketValue
          : estimatedMarketValue // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res> get image {
    return $ImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleSneakerModelImplCopyWith<$Res>
    implements $SingleSneakerModelCopyWith<$Res> {
  factory _$$SingleSneakerModelImplCopyWith(_$SingleSneakerModelImpl value,
          $Res Function(_$SingleSneakerModelImpl) then) =
      __$$SingleSneakerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String sku,
      String brand,
      String name,
      String colorway,
      String gender,
      String silhouette,
      String releaseYear,
      DateTime releaseDate,
      @JsonKey(name: 'retailPrice') int price,
      int estimatedMarketValue,
      @JsonKey(name: 'story') String? description,
      Image image,
      Links links});

  @override
  $ImageCopyWith<$Res> get image;
  @override
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class __$$SingleSneakerModelImplCopyWithImpl<$Res>
    extends _$SingleSneakerModelCopyWithImpl<$Res, _$SingleSneakerModelImpl>
    implements _$$SingleSneakerModelImplCopyWith<$Res> {
  __$$SingleSneakerModelImplCopyWithImpl(_$SingleSneakerModelImpl _value,
      $Res Function(_$SingleSneakerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? brand = null,
    Object? name = null,
    Object? colorway = null,
    Object? gender = null,
    Object? silhouette = null,
    Object? releaseYear = null,
    Object? releaseDate = null,
    Object? price = null,
    Object? estimatedMarketValue = null,
    Object? description = freezed,
    Object? image = null,
    Object? links = null,
  }) {
    return _then(_$SingleSneakerModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == colorway
          ? _value.colorway
          : colorway // ignore: cast_nullable_to_non_nullable
              as String,
      null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      null == silhouette
          ? _value.silhouette
          : silhouette // ignore: cast_nullable_to_non_nullable
              as String,
      null == releaseYear
          ? _value.releaseYear
          : releaseYear // ignore: cast_nullable_to_non_nullable
              as String,
      null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      null == estimatedMarketValue
          ? _value.estimatedMarketValue
          : estimatedMarketValue // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
      null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleSneakerModelImpl implements _SingleSneakerModel {
  _$SingleSneakerModelImpl(
      this.id,
      this.sku,
      this.brand,
      this.name,
      this.colorway,
      this.gender,
      this.silhouette,
      this.releaseYear,
      this.releaseDate,
      @JsonKey(name: 'retailPrice') this.price,
      this.estimatedMarketValue,
      @JsonKey(name: 'story') this.description,
      this.image,
      this.links);

  factory _$SingleSneakerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleSneakerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String sku;
  @override
  final String brand;
  @override
  final String name;
  @override
  final String colorway;
  @override
  final String gender;
  @override
  final String silhouette;
  @override
  final String releaseYear;
  @override
  final DateTime releaseDate;
  @override
  @JsonKey(name: 'retailPrice')
  final int price;
  @override
  final int estimatedMarketValue;
  @override
  @JsonKey(name: 'story')
  final String? description;
  @override
  final Image image;
  @override
  final Links links;

  @override
  String toString() {
    return 'SingleSneakerModel(id: $id, sku: $sku, brand: $brand, name: $name, colorway: $colorway, gender: $gender, silhouette: $silhouette, releaseYear: $releaseYear, releaseDate: $releaseDate, price: $price, estimatedMarketValue: $estimatedMarketValue, description: $description, image: $image, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleSneakerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorway, colorway) ||
                other.colorway == colorway) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.silhouette, silhouette) ||
                other.silhouette == silhouette) &&
            (identical(other.releaseYear, releaseYear) ||
                other.releaseYear == releaseYear) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.estimatedMarketValue, estimatedMarketValue) ||
                other.estimatedMarketValue == estimatedMarketValue) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sku,
      brand,
      name,
      colorway,
      gender,
      silhouette,
      releaseYear,
      releaseDate,
      price,
      estimatedMarketValue,
      description,
      image,
      links);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleSneakerModelImplCopyWith<_$SingleSneakerModelImpl> get copyWith =>
      __$$SingleSneakerModelImplCopyWithImpl<_$SingleSneakerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleSneakerModelImplToJson(
      this,
    );
  }
}

abstract class _SingleSneakerModel implements SingleSneakerModel {
  factory _SingleSneakerModel(
      final String id,
      final String sku,
      final String brand,
      final String name,
      final String colorway,
      final String gender,
      final String silhouette,
      final String releaseYear,
      final DateTime releaseDate,
      @JsonKey(name: 'retailPrice') final int price,
      final int estimatedMarketValue,
      @JsonKey(name: 'story') final String? description,
      final Image image,
      final Links links) = _$SingleSneakerModelImpl;

  factory _SingleSneakerModel.fromJson(Map<String, dynamic> json) =
      _$SingleSneakerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get sku;
  @override
  String get brand;
  @override
  String get name;
  @override
  String get colorway;
  @override
  String get gender;
  @override
  String get silhouette;
  @override
  String get releaseYear;
  @override
  DateTime get releaseDate;
  @override
  @JsonKey(name: 'retailPrice')
  int get price;
  @override
  int get estimatedMarketValue;
  @override
  @JsonKey(name: 'story')
  String? get description;
  @override
  Image get image;
  @override
  Links get links;
  @override
  @JsonKey(ignore: true)
  _$$SingleSneakerModelImplCopyWith<_$SingleSneakerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  List<String> get the360 => throw _privateConstructorUsedError;
  String get original => throw _privateConstructorUsedError;
  String get small => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {List<String> the360, String original, String small, String thumbnail});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? the360 = null,
    Object? original = null,
    Object? small = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      the360: null == the360
          ? _value.the360
          : the360 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageImplCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$ImageImplCopyWith(
          _$ImageImpl value, $Res Function(_$ImageImpl) then) =
      __$$ImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> the360, String original, String small, String thumbnail});
}

/// @nodoc
class __$$ImageImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$ImageImpl>
    implements _$$ImageImplCopyWith<$Res> {
  __$$ImageImplCopyWithImpl(
      _$ImageImpl _value, $Res Function(_$ImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? the360 = null,
    Object? original = null,
    Object? small = null,
    Object? thumbnail = null,
  }) {
    return _then(_$ImageImpl(
      null == the360
          ? _value._the360
          : the360 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageImpl implements _Image {
  _$ImageImpl(
      final List<String> the360, this.original, this.small, this.thumbnail)
      : _the360 = the360;

  factory _$ImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageImplFromJson(json);

  final List<String> _the360;
  @override
  List<String> get the360 {
    if (_the360 is EqualUnmodifiableListView) return _the360;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_the360);
  }

  @override
  final String original;
  @override
  final String small;
  @override
  final String thumbnail;

  @override
  String toString() {
    return 'Image(the360: $the360, original: $original, small: $small, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageImpl &&
            const DeepCollectionEquality().equals(other._the360, _the360) &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_the360), original, small, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      __$$ImageImplCopyWithImpl<_$ImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageImplToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  factory _Image(final List<String> the360, final String original,
      final String small, final String thumbnail) = _$ImageImpl;

  factory _Image.fromJson(Map<String, dynamic> json) = _$ImageImpl.fromJson;

  @override
  List<String> get the360;
  @override
  String get original;
  @override
  String get small;
  @override
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  String get stockX => throw _privateConstructorUsedError;
  String get goat => throw _privateConstructorUsedError;
  String get flightClub => throw _privateConstructorUsedError;
  String get stadiumGoods => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call(
      {String stockX, String goat, String flightClub, String stadiumGoods});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockX = null,
    Object? goat = null,
    Object? flightClub = null,
    Object? stadiumGoods = null,
  }) {
    return _then(_value.copyWith(
      stockX: null == stockX
          ? _value.stockX
          : stockX // ignore: cast_nullable_to_non_nullable
              as String,
      goat: null == goat
          ? _value.goat
          : goat // ignore: cast_nullable_to_non_nullable
              as String,
      flightClub: null == flightClub
          ? _value.flightClub
          : flightClub // ignore: cast_nullable_to_non_nullable
              as String,
      stadiumGoods: null == stadiumGoods
          ? _value.stadiumGoods
          : stadiumGoods // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stockX, String goat, String flightClub, String stadiumGoods});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stockX = null,
    Object? goat = null,
    Object? flightClub = null,
    Object? stadiumGoods = null,
  }) {
    return _then(_$LinksImpl(
      null == stockX
          ? _value.stockX
          : stockX // ignore: cast_nullable_to_non_nullable
              as String,
      null == goat
          ? _value.goat
          : goat // ignore: cast_nullable_to_non_nullable
              as String,
      null == flightClub
          ? _value.flightClub
          : flightClub // ignore: cast_nullable_to_non_nullable
              as String,
      null == stadiumGoods
          ? _value.stadiumGoods
          : stadiumGoods // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksImpl implements _Links {
  _$LinksImpl(this.stockX, this.goat, this.flightClub, this.stadiumGoods);

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  @override
  final String stockX;
  @override
  final String goat;
  @override
  final String flightClub;
  @override
  final String stadiumGoods;

  @override
  String toString() {
    return 'Links(stockX: $stockX, goat: $goat, flightClub: $flightClub, stadiumGoods: $stadiumGoods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksImpl &&
            (identical(other.stockX, stockX) || other.stockX == stockX) &&
            (identical(other.goat, goat) || other.goat == goat) &&
            (identical(other.flightClub, flightClub) ||
                other.flightClub == flightClub) &&
            (identical(other.stadiumGoods, stadiumGoods) ||
                other.stadiumGoods == stadiumGoods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, stockX, goat, flightClub, stadiumGoods);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  factory _Links(final String stockX, final String goat,
      final String flightClub, final String stadiumGoods) = _$LinksImpl;

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  String get stockX;
  @override
  String get goat;
  @override
  String get flightClub;
  @override
  String get stadiumGoods;
  @override
  @JsonKey(ignore: true)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
