import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/models/item_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'list_page_state.dart';

part 'list_page_cubit.freezed.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit({required this.itemsRepository}) : super(const ListPageState());

  final ItemsRepository itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> removeProduct({required String id}) async {
    try {
      await itemsRepository.removeProduct(id: id);
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

    _streamSubscription = itemsRepository.getItemsStream().listen(
      (items) {
        try {
          emit(
            ListPageState(
              items: items,
              status: Status.success,
            ),
          );
        } catch (error) {
          emit(
            ListPageState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
