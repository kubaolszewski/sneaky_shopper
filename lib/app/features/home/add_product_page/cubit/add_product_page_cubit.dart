import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

part 'add_product_page_state.dart';

@injectable
class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit({required this.itemsRepository})
      : super(const AddProductPageState());

  final ItemsRepository itemsRepository;

  Future<void> changeNameValue(String newNameValue) async {
    emit(AddProductPageState(
      nameValue: newNameValue,
      priceValue: state.priceValue,
      sizeValue: state.sizeValue,
      typeValue: state.typeValue,
      image: state.image,
    ));
  }

  Future<void> changePriceValue(String newPriceValue) async {
    emit(AddProductPageState(
      nameValue: state.nameValue,
      priceValue: newPriceValue,
      sizeValue: state.sizeValue,
      typeValue: state.typeValue,
      image: state.image,
    ));
  }

  Future<void> changeSizeValue(String newSizeValue) async {
    emit(AddProductPageState(
      nameValue: state.nameValue,
      priceValue: state.priceValue,
      sizeValue: newSizeValue,
      typeValue: state.typeValue,
      image: state.image,
    ));
  }

  Future<void> setTypeValue(String newTypeValue) async {
    emit(AddProductPageState(
      nameValue: state.nameValue,
      priceValue: state.priceValue,
      sizeValue: state.sizeValue,
      typeValue: newTypeValue,
      image: state.image,
    ));
  }

  Future<void> imageInput(String newImage) async {
    emit(AddProductPageState(
      nameValue: state.nameValue,
      priceValue: state.priceValue,
      sizeValue: state.sizeValue,
      typeValue: state.typeValue,
      image: newImage,
    ));
  }

  Future<void> addProductToList(
    String name,
    String price,
    String size,
    String itemType,
    String image,
  ) async {
    emit(const AddProductPageState(status: Status.loading));
    try {
      await itemsRepository.addProductToList(
        name,
        price,
        size,
        itemType,
        image,
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
    emit(const AddProductPageState(status: Status.loading));
    try {
      emit(const AddProductPageState(
        status: Status.success,
      ));
    } catch (error) {
      emit(AddProductPageState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
