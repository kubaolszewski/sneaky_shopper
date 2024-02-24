part of 'search_page_cubit.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    @Default([]) List<SingleSneakerModel> sneakersModel,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _SearchPageState;
}
