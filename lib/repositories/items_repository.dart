import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/item_details_model.dart';
import 'package:sneaky_shopper/models/item_model.dart';

class ItemsRepository {
  ItemsRepository(this._itemsRemoteDataSource);

  final ItemsRemoteFirestoreDataSource _itemsRemoteDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    return _itemsRemoteDataSource.getItemsStream();
  }

  Future<ItemDetailsModel> getDetails({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    return _itemsRemoteDataSource.getDetails(id: id);
  }

  Future<void> addProduct(
    String name,
    String price,
    String size,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    return _itemsRemoteDataSource.addProduct(name, price, size);
  }

  Future<void> removeProduct({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    return _itemsRemoteDataSource.removeProduct(id: id);
  }
}
