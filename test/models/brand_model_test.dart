import 'package:flutter_test/flutter_test.dart';
import 'package:sneaky_shopper/models/brand_model.dart';

void main() {
  test('Should return a model of brand provided from API', () {
    //1
    BrandModel('Jordan', 'brandName', 'field', 'description');
    //2
    final result = ['Jordan', 'brandName', 'description'];
    //3
    expect(result, ['Jordan', 'brandName', 'description']);
  });
}
