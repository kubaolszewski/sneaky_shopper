import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
class BrandModel with _$BrandModel {
  
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory BrandModel(
    final String image,
    final String brandName,
    final String field,
    final String description,
  ) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}

