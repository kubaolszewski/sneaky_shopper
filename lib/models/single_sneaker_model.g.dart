// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_sneaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleSneakerModelImpl _$$SingleSneakerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SingleSneakerModelImpl(
      json['id'] as String,
      json['sku'] as String,
      json['brand'] as String,
      json['name'] as String,
      json['colorway'] as String,
      json['gender'] as String,
      json['silhouette'] as String,
      json['releaseYear'] as String,
      DateTime.parse(json['releaseDate'] as String),
      json['retailPrice'] as int,
      json['estimatedMarketValue'] as int,
      json['story'] as String?,
      Image.fromJson(json['image'] as Map<String, dynamic>),
      Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SingleSneakerModelImplToJson(
        _$SingleSneakerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'brand': instance.brand,
      'name': instance.name,
      'colorway': instance.colorway,
      'gender': instance.gender,
      'silhouette': instance.silhouette,
      'releaseYear': instance.releaseYear,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'retailPrice': instance.price,
      'estimatedMarketValue': instance.estimatedMarketValue,
      'story': instance.description,
      'image': instance.image,
      'links': instance.links,
    };

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      (json['the360'] as List<dynamic>).map((e) => e as String).toList(),
      json['original'] as String,
      json['small'] as String,
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'the360': instance.the360,
      'original': instance.original,
      'small': instance.small,
      'thumbnail': instance.thumbnail,
    };

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) => _$LinksImpl(
      json['stockX'] as String,
      json['goat'] as String,
      json['flightClub'] as String,
      json['stadiumGoods'] as String,
    );

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'stockX': instance.stockX,
      'goat': instance.goat,
      'flightClub': instance.flightClub,
      'stadiumGoods': instance.stadiumGoods,
    };
