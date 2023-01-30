part of 'item_details_cubit.dart';

class ItemDetailsState {
  ItemDetailsState({
    this.itemDetailsModel,
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final ItemModel? itemDetailsModel;
  final Status status;
  final String? errorMessage;
}
