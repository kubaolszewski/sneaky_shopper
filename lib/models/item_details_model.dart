class ItemDetailsModel {
  ItemDetailsModel({
    required this.name,
    required this.price,
    required this.size,
    this.image = '',
    this.itemType = '',
    this.description = '',
  });
  final String name;
  final String price;
  final String size;
  final String image;
  final String itemType;
  final String description;

  ItemDetailsModel.fromJson(Map<String, dynamic> json)
      : name = '',
        price = '',
        size = '',
        image = json['details']['image'],
        itemType = json['details']['item_type_connector'],
        description = json['details']['description'];
}
