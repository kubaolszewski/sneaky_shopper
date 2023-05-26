import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_info_remote_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/models/brand_model.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class MockItemsInfoRemoteRetrofitDataSource extends Mock
    implements ItemsInfoRemoteRetrofitDataSource {}

class MockItemsRemoteFirestoreDataSource extends Mock
    implements ItemsRemoteFirestoreDataSource {}

void main() {
  late ItemsRepository sut;
  late MockItemsRemoteFirestoreDataSource dataSource1;
  late MockItemsInfoRemoteRetrofitDataSource dataSource2;

  setUp(() {
    dataSource1 = MockItemsRemoteFirestoreDataSource();
    dataSource2 = MockItemsInfoRemoteRetrofitDataSource();
    sut = ItemsRepository(
      itemsRemoteFirestoreDataSource: dataSource1,
      itemsRemoteRetrofitDataSource: dataSource2,
    );
  });

  group('provideRemoteInfo', () {
    test('should call itemsRemoteRetrofitDataSource.provideRemoteInfo() method',
        () async {
      //1
      when(() => dataSource2.provideRemoteInfo()).thenAnswer((_) async => []);
      //2
      await sut.provideRemoteInfo();
      //3
      verify(() => dataSource2.provideRemoteInfo()).called(1);
    });
    test('should return item info results from data source', () async {
      //1
      when(() => dataSource2.provideRemoteInfo()).thenAnswer(
        (_) async => [
          ItemInfoModel('Sneakers', 'image1', 'description1'),
          ItemInfoModel('Sneakers', 'image2', 'description2'),
          ItemInfoModel('Sneakers', 'image3', 'description3'),
        ],
      );
      //2
      final results = await sut.provideRemoteInfo();
      //3
      expect(results, [
        ItemInfoModel('Sneakers', 'image1', 'description1'),
        ItemInfoModel('Sneakers', 'image2', 'description2'),
        ItemInfoModel('Sneakers', 'image3', 'description3'),
      ]);
    });
  });

  group('provideBrands', () {
    test('should call itemsRemoteRetrofitDataSource.provideBrands() method',
        () async {
      //1
      when(() => dataSource2.provideBrands()).thenAnswer((_) async => []);
      //2
      await sut.provideBrands();
      //3
      verify(() => dataSource2.provideBrands()).called(1);
    });
    test('should return brand results from data source', () async {
      //1
      when(() => dataSource2.provideBrands()).thenAnswer(
        (_) async => [
          BrandModel('image1', 'Nike', 'Streetwear', 'description1'),
          BrandModel('image2', 'Nike', 'Streetwear', 'description2'),
          BrandModel('image3', 'Nike', 'Streetwear', 'description3'),
        ],
      );
      //2
      final results = await sut.provideBrands();
      //3
      expect(results, [
          BrandModel('image1', 'Nike', 'Streetwear', 'description1'),
          BrandModel('image2', 'Nike', 'Streetwear', 'description2'),
          BrandModel('image3', 'Nike', 'Streetwear', 'description3'),
      ]);
    });
  });
}
