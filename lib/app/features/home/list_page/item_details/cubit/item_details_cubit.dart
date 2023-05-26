import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'item_details_state.dart';

part 'item_details_cubit.freezed.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit({required this.itemsRepository})
      : super(const ItemDetailsState());

  final ItemsRepository itemsRepository;

  Future<void> getItemWithID({required String id}) async {
    emit(const ItemDetailsState(status: Status.loading));
    try {
      final itemDetailsModel = await itemsRepository.getDetails(id: id);
      emit(
        ItemDetailsState(
          itemDetailsModel: itemDetailsModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        const ItemDetailsState(status: Status.error),
      );
      throw Exception(error.toString());
    }
  }
}
