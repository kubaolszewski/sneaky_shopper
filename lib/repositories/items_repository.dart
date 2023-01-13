import 'package:sneaky_shopper/data/remote_data_sources/items_remote_dio_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_details_model.dart';
import 'package:sneaky_shopper/models/item_model.dart';

class ItemsRepository {
  ItemsRepository(
      this._itemsRemoteFirestoreDataSource, this._itemsRemoteDioDataSource);

  final ItemsRemoteFirestoreDataSource _itemsRemoteFirestoreDataSource;
  final ItemsRemoteDioDataSource _itemsRemoteDioDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    return _itemsRemoteFirestoreDataSource.getItemsStream();
  }

  Future<ItemDetailsModel> getDetails({required String id}) async {
    return _itemsRemoteFirestoreDataSource.getDetails(id: id);
  }

  Future<ItemDetailsModel?> getRemoteData() async {
    final json = await _itemsRemoteDioDataSource.getRemoteData();
    if (json == null) {
      return null;
    }
    return ItemDetailsModel.fromJson(json);
  }

  Future<void> addProduct(
    String name,
    String price,
    String size,
    String itemType,
  ) async {
    return _itemsRemoteFirestoreDataSource.addProduct(
      name,
      price,
      size,
      itemType,
    );
  }

  Future<void> removeProduct({required String id}) {
    return _itemsRemoteFirestoreDataSource.removeProduct(id: id);
  }
}
