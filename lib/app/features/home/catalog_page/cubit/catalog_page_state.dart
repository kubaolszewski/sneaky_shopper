part of 'catalog_page_cubit.dart';

@freezed
class CatalogPageState with _$CatalogPageState {
  const factory CatalogPageState({
    @Default([]) List<ItemInfoModel> itemInfo,
    @Default([]) List<BrandModel> brandsInfo,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _CatalogPageState;
}

