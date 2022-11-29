part of 'list_page_cubit.dart';

@immutable
class ListPageState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  const ListPageState({
    required this.documents,
  });
}
