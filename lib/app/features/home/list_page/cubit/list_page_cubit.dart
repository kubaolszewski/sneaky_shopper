import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneaky_shopper/models/item_model.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit() : super(const ListPageState());

  StreamSubscription? _streamSubscription;

  Future<void> removeProduct({required String id}) async {
    try {
      await FirebaseFirestore.instance.collection('items').doc(id).delete();
    } catch (error) {
      emit(
        ListPageState(errorMessage: error.toString()),
      );
      start();
    }
  }

  Future<void> start() async {
    emit(
      const ListPageState(
        items: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    await Future.delayed(
      Duration(seconds: (2.5).toInt()),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('items')
        .orderBy('price', descending: false)
        .snapshots()
        .listen(
      (items) {
        final itemModels = items.docs.map((doc) {
          return ItemModel(
            id: doc.id,
            name: doc['name'],
            price: doc['price'],
            size: doc['size'],
          );
        }).toList();
        emit(
          ListPageState(
            items: itemModels,
          ),
        );
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
