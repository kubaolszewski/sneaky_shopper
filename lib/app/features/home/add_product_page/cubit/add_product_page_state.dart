part of 'add_product_page_cubit.dart';

@freezed
class AddProductPageState with _$AddProductPageState {
  const factory AddProductPageState({
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
    @Default('') String nameValue,
    @Default('') String priceValue,
    @Default('') String sizeValue,
    @Default('') String typeValue,
    @Default('') String image,
  }) = _AddProductPageState;
}

