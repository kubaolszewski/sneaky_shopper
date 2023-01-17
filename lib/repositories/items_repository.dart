import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_model.dart';

class ItemsRepository {
  ItemsRepository(
      this._itemsRemoteFirestoreDataSource, this._itemsRemoteDioDataSource);

  final ItemsRemoteFirestoreDataSource _itemsRemoteFirestoreDataSource;
  final ItemsRemoteDioDataSource _itemsRemoteDioDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    return _itemsRemoteFirestoreDataSource.getItemsStream();
  }

  Future<ItemModel> getDetails({required String id}) async {
    return _itemsRemoteFirestoreDataSource.getDetails(id: id);
  }

  // Future<List<ItemModel?>> provideRemoteDetailsForType(
  //     {required String itemType}) async {
  //   final jsonItem = await _itemsRemoteDioDataSource.provideRemoteDetails();
  //   if (jsonItem == null) {
  //     return [];
  //   }
  //   final remoteiItems =
  //       jsonItem.map((item) => ItemModel.fromJson(item)).toList();

  //   return remoteiItems.where((item) => item.itemType == itemType).toList();
  // }

  Future<void> addProductToList(
    String name,
    String price,
    String size,
    String itemType,
    String image,
  ) async {
    return _itemsRemoteFirestoreDataSource.addProductToList(
      name,
      price,
      size,
      itemType,
      image,
    );
  }

  Future<void> removeProduct({required String id}) {
    return _itemsRemoteFirestoreDataSource.removeProduct(id: id);
  }
}
