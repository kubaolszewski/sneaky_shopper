import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'catalog_page_state.dart';

@injectable
class CatalogPageCubit extends Cubit<CatalogPageState> {
  CatalogPageCubit({required this.itemsRepository}) : super(const CatalogPageState());

  final ItemsRepository itemsRepository;

  Future<void> start() async {
    emit(const CatalogPageState(
      status: Status.loading,
    ));
    try {
      final itemInfo = await itemsRepository.provideRemoteInfo();
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