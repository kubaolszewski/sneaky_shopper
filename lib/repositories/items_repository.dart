import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneaky_shopper/models/item_model.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('price', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ItemModel(
            id: doc.id,
            name: doc['name'],
            price: doc['price'],
            size: doc['size'],
          );
        },
      ).toList();
    });
  }

  Future<void> removeProduct({required String id}) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
  }

  Future<void> addProduct(
    String name,
    String price,
    String size,
  ) async {
    await FirebaseFirestore.instance.collection('items').add(
      {
        'name': name,
        'price': price,
        'size': size,
      },
    );
  }
}
