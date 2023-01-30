import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/models/brand_model.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'catalog_page_state.dart';

class CatalogPageCubit extends Cubit<CatalogPageState> {
  CatalogPageCubit({required this.itemsRepository})
      : super(const CatalogPageState());

  final ItemsRepository itemsRepository;

  Future<void> start() async {
    emit(const CatalogPageState(
      status: Status.loading,
    ));
    try {
      final itemInfo = await itemsRepository.provideRemoteInfo();
      final brandsInfo = await itemsRepository.provideBrands();
      emit(CatalogPageState(
        itemInfo: itemInfo,
        brandsInfo: brandsInfo,
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
