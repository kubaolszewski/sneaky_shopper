import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit() : super(const ListPageState());

  StreamSubscription? _streamSubscription;

  Future<void> removeProduct({required String id}) async {
    try {
      await FirebaseFirestore.instance.collection('shoes').doc(id).delete();
    } catch (error) {
      emit(
        ListPageState(
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  Future<void> start() async {
    emit(
      const ListPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('shoes')
        .orderBy('price', descending: true)
        .snapshots()
        .listen(
      (data) {
        emit(
          ListPageState(
            documents: data.docs,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            ListPageState(
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
