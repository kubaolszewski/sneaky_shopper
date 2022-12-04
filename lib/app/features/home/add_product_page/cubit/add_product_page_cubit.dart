import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_product_page_state.dart';

class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit()
      : super(const AddProductPageState(
          isLoading: false,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  Future<void> addProduct(
    String name,
    String price,
    String size,
  ) async {
    FirebaseFirestore.instance
        .collection('shoes')
        .add({'name': name, 'price': price, 'size': size});
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
