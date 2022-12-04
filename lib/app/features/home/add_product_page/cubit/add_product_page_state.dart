part of 'add_product_page_cubit.dart';

@immutable
class AddProductPageState {
  final bool isLoading;
  final String errorMessage;

  const AddProductPageState({
    required this.isLoading,
    required this.errorMessage,
  });
}
