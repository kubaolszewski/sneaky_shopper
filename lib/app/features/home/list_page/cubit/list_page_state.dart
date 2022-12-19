part of 'list_page_cubit.dart';

class ListPageState {
  const ListPageState({
    this.documents = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;
}
