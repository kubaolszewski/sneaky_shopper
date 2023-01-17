class ItemInfoModel {
  ItemInfoModel({
    required this.image,
    required this.type,
    required this.description,
  });

  final String image;
  final String type;
  final String description;

  ItemInfoModel.fromJson(Map<String, dynamic> json)
      : image = '',
        type = '',
        description = '';
}
