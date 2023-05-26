import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_info_model.g.dart';
part 'item_info_model.freezed.dart';


@freezed
class ItemInfoModel with _$ItemInfoModel {
  
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ItemInfoModel(
  final String itemType,
  final String image,
  final String description,
  ) = _ItemInfoModel;

  factory ItemInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ItemInfoModelFromJson(json);
}