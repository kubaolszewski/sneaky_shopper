import 'package:sneaky_shopper/data/remote_data_sources/items_info_remote_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/models/item_model.dart';

class ItemsRepository {
  ItemsRepository({
      required this.itemsRemoteFirestoreDataSource, required this.itemsRemoteRetrofitDataSource});

  final ItemsRemoteFirestoreDataSource itemsRemoteFirestoreDataSource;
  final ItemsInfoRemoteRetrofitDataSource itemsRemoteRetrofitDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    return itemsRemoteFirestoreDataSource.getItemsStream();
  }

  Future<ItemModel> getDetails({required String id}) async {
    return itemsRemoteFirestoreDataSource.getDetails(id: id);
  }

  Future<List<ItemInfoModel>> provideRemoteInfo() async {
    return itemsRemoteRetrofitDataSource.provideRemoteInfo();
  }

  Future<void> addProductToList(String name, String price, String size,
      String itemType, String image) async {
    return itemsRemoteFirestoreDataSource.addProductToList(
        name, price, size, itemType, image);
  }

  Future<void> removeProduct({required String id}) {
    return itemsRemoteFirestoreDataSource.removeProduct(id: id);
  }
}
