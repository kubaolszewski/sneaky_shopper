import 'package:bloc/bloc.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
// import 'package:sneaky_shopper/models/item_details_model.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit(this._itemsRepository)
      : super(ItemDetailsState(itemDetailsModel: null));

  final ItemsRepository _itemsRepository;

  Future<void> getItemWithID(
      {required String id}) async {
    emit(ItemDetailsState(status: Status.loading));
    try {
      final itemDetailsModel = await _itemsRepository.getDetails(id: id);
      emit(
        ItemDetailsState(
          itemDetailsModel: itemDetailsModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        ItemDetailsState(status: Status.error),
      );
      throw Exception(error.toString());
    }
  }
}
