import 'package:bloc/bloc.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit(this._itemsRepository)
      : super(ItemDetailsState(itemModel: null));

  final ItemsRepository _itemsRepository;

  Future<void> getItemWithID({required String id}) async {
    try {
      final itemModel = await _itemsRepository.get(id: id);
      emit(ItemDetailsState(itemModel: itemModel));
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
