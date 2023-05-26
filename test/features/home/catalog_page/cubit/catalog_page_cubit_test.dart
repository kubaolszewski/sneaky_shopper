import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/cubit/catalog_page_cubit.dart';
import 'package:sneaky_shopper/models/brand_model.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';

class MockItemsRepository extends Mock implements ItemsRepository {}

void main() {
  late CatalogPageCubit sut;
  late MockItemsRepository repository;

  setUp(() {
    repository = MockItemsRepository();
    sut = CatalogPageCubit(itemsRepository: repository);
  });

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.provideRemoteInfo()).thenAnswer(
          (_) async => [
            ItemInfoModel('Sneakers', 'image1', 'description1'),
            ItemInfoModel('Sneakers', 'image2', 'description2'),
            ItemInfoModel('Sneakers', 'image3', 'description3'),
          ],
        );
        when(() => repository.provideBrands()).thenAnswer(
          (_) async => [
            BrandModel('image1', 'Nike', 'Streetwear', 'description1'),
            BrandModel('image2', 'Nike', 'Streetwear', 'description2'),
            BrandModel('image3', 'Nike', 'Streetwear', 'description3'),
          ],
        );
      });
      blocTest<CatalogPageCubit, CatalogPageState>(
        'emits Status.loading then Status.success with data provided from API',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          const CatalogPageState(
            status: Status.loading,
          ),
          CatalogPageState(
            itemInfo: [
              ItemInfoModel('Sneakers', 'image1', 'description1'),
              ItemInfoModel('Sneakers', 'image2', 'description2'),
              ItemInfoModel('Sneakers', 'image3', 'description3'),
            ],
            brandsInfo: [
              BrandModel('image1', 'Nike', 'Streetwear', 'description1'),
              BrandModel('image2', 'Nike', 'Streetwear', 'description2'),
              BrandModel('image3', 'Nike', 'Streetwear', 'description3'),
            ],
            status: Status.success,
          )
        ],
      );
    });
  });

  group('failure', () {
    setUp(() {
      when(() => repository.provideRemoteInfo()).thenThrow(
        Exception('test-exception-error'),
      );
      when(() => repository.provideBrands()).thenThrow(
        Exception('test-exception-error'),
      );
    });
    blocTest<CatalogPageCubit, CatalogPageState>(
      'emits Status.loading then Status.error with error message',
      build: () => sut,
      act: (cubit) => cubit.start(),
      expect: () => [
        const CatalogPageState(
          status: Status.loading,
        ),
        const CatalogPageState(
          status: Status.error,
          errorMessage: 'Exception: test-exception-error',
        )
      ],
    );
  });
}
