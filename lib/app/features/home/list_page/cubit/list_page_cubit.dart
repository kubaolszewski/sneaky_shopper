import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit(this._itemsRepository) : super(const ListPageState());

  final ItemsRepository _itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> removeProduct({required String id}) async {
    try {
      await _itemsRepository.removeProduct(id: id);
    } catch (error) {
      emit(
        ListPageState(errorMessage: error.toString()),
      );
      start();
    }
  }

  Future<void> start() async {
    emit(
      const ListPageState(items: [], isLoading: true, errorMessage: ''),
    );

    await Future.delayed(
      Duration(seconds: (2.5).toInt()),
    );

    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        emit(ListPageState(items: items));
      },
    )..onError(
        (error) {
          emit(
            ListPageState(errorMessage: error.toString()),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
