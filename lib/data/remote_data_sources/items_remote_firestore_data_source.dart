import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneaky_shopper/models/item_details_model.dart';
import 'package:sneaky_shopper/models/item_model.dart';

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
        .orderBy('price', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ItemModel(
            id: doc.id,
            image: doc['image'],
            itemType: doc['item_type'],
            name: doc['name'],
          );
        },
      ).toList();
    });
  }

  Future<ItemDetailsModel> getDetails({required String id}) async {
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
    return ItemDetailsModel(
      image: doc['image'],
      // itemType: doc['item_type'],
      name: doc['name'],
      price: doc['price'],
      size: doc['size'],
      // description: doc['description']
    );
  }

  Future<void> addProduct(
    String name,
    String price,
    String size,
    String itemType,
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
