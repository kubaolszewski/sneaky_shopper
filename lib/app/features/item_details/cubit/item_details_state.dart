part of 'item_details_cubit.dart';

class ItemDetailsState {
  ItemDetailsState({
    this.itemModel,
    this.status = Status.initial,
  });

  final ItemModel? itemModel;
  final Status status;
}
