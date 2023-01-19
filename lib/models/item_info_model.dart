class ItemInfoModel {
  ItemInfoModel({
    required this.type,
    required this.image,
    required this.description,
  });

  final String type;
  final String image;
  final String description;

  ItemInfoModel.fromJson(Map<String, dynamic> json)
      : type = json['item_type'],
        image = json['image'],
        description = json['description'];
}
