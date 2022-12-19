part of 'add_product_page_cubit.dart';

class AddProductPageState {
  const AddProductPageState({
    this.isLoading = false,
    this.errorMessage = '',
    this.nameValue = '',
    this.priceValue = '',
    this.sizeValue = '',
  });

  final bool isLoading;
  final String errorMessage;
  final String nameValue;
  final String priceValue;
  final String sizeValue;
}
