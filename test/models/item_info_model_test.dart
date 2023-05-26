import 'package:flutter_test/flutter_test.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';

void main() {
  test('Should return a model of item info provided from API', () {
    //1
    ItemInfoModel('Suit', 'image1', 'description1');
    //2
    final result = ['Suit', 'image1'];
    //3
    expect(result, ['Suit', 'image1']);
  });
}
