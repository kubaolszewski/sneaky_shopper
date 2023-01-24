import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sneaky_shopper/models/item_model.dart';

@injectable
class ItemsRemoteFirestoreDataSource {
  Stream<List<ItemModel>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('items')
        .orderBy('item_type', descending: false)
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return ItemModel(
              id: doc.id,
              name: doc['name'],
              price: doc['price'],
              size: doc['size'],
              itemType: doc['item_type'],
              image: doc['image'],
            );
          },
        ).toList();
      },
    );
  }

  Future<ItemModel> getDetails({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('items')
        .doc(id)
        .get();
    return ItemModel(
      id: id,
      name: doc['name'],
      price: doc['price'],
      size: doc['size'],
      itemType: doc['item_type'],
      image: doc['image'],
    );
  }

  Future<void> addProductToList(
    String name,
    String price,
    String size,
    String itemType,
    String image,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('items')
        .add(
      {
        'name': name,
        'price': price,
        'size': size,
        'item_type': itemType,
        'image': image,
      },
    );
  }

  Future<void> removeProduct({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in.');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('items')
        .doc(id)
        .delete();
  }
}
