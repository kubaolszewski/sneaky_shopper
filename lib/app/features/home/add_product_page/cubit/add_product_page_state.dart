part of 'add_product_page_cubit.dart';

@immutable
class AddProductPageState {
  final bool isLoading;
  final String errorMessage;
  final String nameValue;
  final String priceValue;
  final String sizeValue;

  const AddProductPageState({
    required this.isLoading,
    required this.errorMessage,
    required this.nameValue,
    required this.priceValue,
    required this.sizeValue,
  });
}
