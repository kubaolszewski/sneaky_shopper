part of 'item_details_cubit.dart';

class ItemDetailsState {
  ItemDetailsState({
    this.itemDetailsModel,
    this.status = Status.initial,
  });

  final ItemDetailsModel? itemDetailsModel;
  final Status status;
}
