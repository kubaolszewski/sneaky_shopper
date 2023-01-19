import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'catalog_page_state.dart';

class CatalogPageCubit extends Cubit<CatalogPageState> {
  CatalogPageCubit(this._itemsRepository) : super(const CatalogPageState());

  final ItemsRepository _itemsRepository;

  Future<void> start() async {
    emit(const CatalogPageState(
      status: Status.loading,
    ));
    try {
      final itemInfo = await _itemsRepository.provideRemoteInfo();
      emit(CatalogPageState(
        itemInfo: itemInfo,
        status: Status.success,
      ));
    } catch (error) {
      emit(CatalogPageState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
