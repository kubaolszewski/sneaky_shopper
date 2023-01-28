part of 'add_product_page_cubit.dart';

class AddProductPageState {
  const AddProductPageState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.nameValue = '',
    this.priceValue = '',
    this.sizeValue = '',
    this.typeValue = '',
    this.image = '',
  });

  final Status status;
  final String errorMessage;
  final String nameValue;
  final String priceValue;
  final String sizeValue;
  final String typeValue;
    final String image;

}
