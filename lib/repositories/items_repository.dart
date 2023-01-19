import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/models/item_model.dart';

class ItemsRepository {
  ItemsRepository(
      this._itemsRemoteFirestoreDataSource, this._itemsRemoteDioDataSource);

  final ItemsRemoteFirestoreDataSource _itemsRemoteFirestoreDataSource;
  final ItemsInfoRemoteDioDataSource _itemsRemoteDioDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    return _itemsRemoteFirestoreDataSource.getItemsStream();
  }

  Future<ItemModel> getDetails({required String id}) async {
    return _itemsRemoteFirestoreDataSource.getDetails(id: id);
  }

  Future<List<ItemInfoModel>> provideRemoteInfo() async {
    final jsonItemsInfo = await _itemsRemoteDioDataSource.provideRemoteInfo();
    if (jsonItemsInfo == null) {
      return [];
    }
    return jsonItemsInfo.map((info) => ItemInfoModel.fromJson(info)).toList();
  }

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
