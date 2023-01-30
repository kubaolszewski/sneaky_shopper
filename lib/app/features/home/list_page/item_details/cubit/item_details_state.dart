part of 'item_details_cubit.dart';

@freezed
class ItemDetailsState with _$ItemDetailsState {
  const factory ItemDetailsState({
    ItemModel? itemDetailsModel,
    @Default(Status.initial) Status status,
     String? errorMessage,
  }) = _ItemDetailsState;
}