import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
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
        ListPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  Future<void> start() async {
    emit(
      const ListPageState(
        items: [],
        status: Status.loading,
        errorMessage: '',
      ),
    );

    await Future.delayed(
      Duration(
        seconds: (2.5).toInt(),
      ),
    );

    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        emit(
          ListPageState(
            items: items,
            status: Status.success,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            ListPageState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
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
