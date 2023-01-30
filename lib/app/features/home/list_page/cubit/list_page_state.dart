part of 'list_page_cubit.dart';

@freezed
class ListPageState with _$ListPageState {
  const factory ListPageState({
    @Default([]) List<ItemModel> items,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _ListPageState;
}
