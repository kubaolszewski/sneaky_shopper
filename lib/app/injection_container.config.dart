// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sneaky_shopper/app/cubit/root_cubit.dart' as _i5;
import 'package:sneaky_shopper/app/features/home/add_product_page/cubit/add_product_page_cubit.dart'
    as _i10;
import 'package:sneaky_shopper/app/features/home/catalog_page/cubit/catalog_page_cubit.dart'
    as _i11;
import 'package:sneaky_shopper/app/features/home/list_page/cubit/list_page_cubit.dart'
    as _i9;
import 'package:sneaky_shopper/app/features/home/list_page/item_details/cubit/item_details_cubit.dart'
    as _i12;
import 'package:sneaky_shopper/app/injection_container.dart' as _i13;
import 'package:sneaky_shopper/data/remote_data_sources/items_info_remote_data_source.dart'
    as _i7;
import 'package:sneaky_shopper/data/remote_data_sources/items_remote_firestore_data_source.dart'
    as _i3;
import 'package:sneaky_shopper/repositories/items_repository.dart' as _i8;
import 'package:sneaky_shopper/repositories/login_repository.dart' as _i4;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.ItemsRemoteFirestoreDataSource>(
        () => _i3.ItemsRemoteFirestoreDataSource());
    gh.factory<_i4.LoginRepository>(() => _i4.LoginRepository());
    gh.factory<_i5.RootCubit>(
        () => _i5.RootCubit(loginRepository: gh<_i4.LoginRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i6.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i7.ItemsInfoRemoteRetrofitDataSource>(
        () => _i7.ItemsInfoRemoteRetrofitDataSource(gh<_i6.Dio>()));
    gh.factory<_i8.ItemsRepository>(() => _i8.ItemsRepository(
          itemsRemoteFirestoreDataSource:
              gh<_i3.ItemsRemoteFirestoreDataSource>(),
          itemsRemoteRetrofitDataSource:
              gh<_i7.ItemsInfoRemoteRetrofitDataSource>(),
        ));
    gh.factory<_i9.ListPageCubit>(
        () => _i9.ListPageCubit(itemsRepository: gh<_i8.ItemsRepository>()));
    gh.factory<_i10.AddProductPageCubit>(() =>
        _i10.AddProductPageCubit(itemsRepository: gh<_i8.ItemsRepository>()));
    gh.factory<_i11.CatalogPageCubit>(() =>
        _i11.CatalogPageCubit(itemsRepository: gh<_i8.ItemsRepository>()));
    gh.factory<_i12.ItemDetailsCubit>(() =>
        _i12.ItemDetailsCubit(itemsRepository: gh<_i8.ItemsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
