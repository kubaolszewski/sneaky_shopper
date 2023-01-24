import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart';
import 'package:sneaky_shopper/app/features/home/catalog_page/cubit/catalog_page_cubit.dart';
import 'package:sneaky_shopper/app/features/home/list_page/cubit/list_page_cubit.dart';
import 'package:sneaky_shopper/app/features/item_details/cubit/item_details_cubit.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_info_remote_data_source.dart';
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart';
import 'package:sneaky_shopper/repositories/items_repository.dart';
import 'package:sneaky_shopper/repositories/login_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => RootCubit(loginRepository: getIt()));
  getIt.registerFactory(() => AddProductPageCubit(itemsRepository: getIt()));
  getIt.registerFactory(() => ListPageCubit(itemsRepository: getIt()));
  getIt.registerFactory(() => ItemDetailsCubit(itemsRepository: getIt()));
  getIt.registerFactory(() => CatalogPageCubit(itemsRepository: getIt()));

  // Repositories
  getIt.registerFactory(() => ItemsRepository(
      itemsRemoteFirestoreDataSource: getIt(),
      itemsRemoteRetrofitDataSource: getIt()));
  getIt.registerFactory(() => LoginRepository());

  // Data sources
  getIt.registerFactory(() => ItemsRemoteFirestoreDataSource());
  getIt.registerFactory(() => ItemsInfoRemoteRetrofitDataSource(Dio()));
}
