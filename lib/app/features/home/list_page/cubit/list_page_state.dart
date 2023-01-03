part of 'list_page_cubit.dart';

class ListPageState {
  const ListPageState({
    this.items = const [],
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final List<ItemModel> items;
  final Status status;
  final String errorMessage;
}
