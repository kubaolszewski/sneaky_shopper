import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit()
      : super(const ListPageState(
          documents: [],
          isLoading: false,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ListPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    await Future.delayed(const Duration(
      seconds: 2,
    ));

    _streamSubscription = FirebaseFirestore.instance
        .collection('shoes')
        .orderBy('price', descending: true)
        .snapshots()
        .listen((data) {
      emit(
        ListPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ListPageState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
