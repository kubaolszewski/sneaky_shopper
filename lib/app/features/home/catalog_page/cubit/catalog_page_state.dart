part of 'catalog_page_cubit.dart';

@immutable
class CatalogPageState {
  const CatalogPageState({
    this.itemInfo = const [],
    this.brandsInfo = const [],
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final List<ItemInfoModel> itemInfo;
  final List<BrandModel> brandsInfo;
  final Status status;
  final String errorMessage;
}
