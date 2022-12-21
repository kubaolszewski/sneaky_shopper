import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_product_page_state.dart';

class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit() : super(const AddProductPageState());

  StreamSubscription? _streamSubscription;

  Future<void> changeNameValue(String newNameValue) async {
    emit(AddProductPageState(
      nameValue: newNameValue,
      priceValue: state.priceValue,
      sizeValue: state.sizeValue,
    ));
  }

  Future<void> changePriceValue(String newPriceValue) async {
    emit(AddProductPageState(
      nameValue: state.nameValue,
      priceValue: newPriceValue,
      sizeValue: state.sizeValue,
    ));
  }

  Future<void> changeSizeValue(String newSizeValue) async {
    emit(AddProductPageState(
      nameValue: state.nameValue,
      priceValue: state.priceValue,
      sizeValue: newSizeValue,
    ));
  }

  Future<void> addProduct(String name, String price, String size) async {
    try {
      await FirebaseFirestore.instance.collection('items').add(
        {
          'name': name,
          'price': price,
          'size': size,
        },
      );
    } catch (error) {
      emit(
        AddProductPageState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> start() async {
    emit(const AddProductPageState(
      isLoading: false,
      errorMessage: '',
      nameValue: '',
      priceValue: '',
      sizeValue: '',
    ));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
