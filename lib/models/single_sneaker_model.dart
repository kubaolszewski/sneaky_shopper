import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_sneaker_model.freezed.dart';
part 'single_sneaker_model.g.dart';

@freezed
class SingleSneakerModel with _$SingleSneakerModel {
  factory SingleSneakerModel(
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
    @JsonKey(name: 'story') String? description,
    final Image image,
    final Links links,
  ) = _SingleSneakerModel;

  factory SingleSneakerModel.fromJson(Map<String, dynamic> json) =>
      _$SingleSneakerModelFromJson(json);
}

@freezed
class Image with _$Image {
  factory Image(
    final List<String> the360,
    final String original,
    final String small,
    final String thumbnail,
  ) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Links with _$Links {
  factory Links(
    final String stockX,
    final String goat,
    final String flightClub,
    final String stadiumGoods,
  ) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}
