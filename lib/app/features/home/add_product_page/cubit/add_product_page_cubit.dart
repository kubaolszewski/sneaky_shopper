import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'add_product_page_state.dart';

class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit(this._itemsRepository)
      : super(const AddProductPageState());

  final ItemsRepository _itemsRepository;

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

  Future<void> addProduct(
    String name,
    String price,
    String size,
    String itemType,
  ) async {
    emit(const AddProductPageState(status: Status.loading));
    try {
      await _itemsRepository.addProduct(
        name,
        price,
        size,
        itemType,
      );
    } catch (error) {
      emit(
        AddProductPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> start() async {
    // emit(const AddProductPageState(status: Status.loading));
    try {
      emit(const AddProductPageState(
        status: Status.success,
        errorMessage: '',
        nameValue: '',
        priceValue: '',
        sizeValue: '',
      ));
    } catch (error) {
      emit(AddProductPageState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
