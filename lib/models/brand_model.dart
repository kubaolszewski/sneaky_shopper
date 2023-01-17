class BrandModel {
  BrandModel({
    required this.image,
    required this.brandName,
    required this.description,
  });

  final String image;
  final String brandName;
  final String description;

  BrandModel.fromJson(Map<String, dynamic> json)
      : image = '',
        brandName = '',
        description = '';
}
