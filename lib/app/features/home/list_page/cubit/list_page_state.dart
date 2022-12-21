part of 'list_page_cubit.dart';

class ListPageState {
  const ListPageState({
    this.items = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  final List<ItemModel> items;
  final bool isLoading;
  final String errorMessage;
}
