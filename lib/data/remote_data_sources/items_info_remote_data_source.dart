import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';

part 'items_info_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class ItemsInfoRemoteRetrofitDataSource {
  @factoryMethod
  factory ItemsInfoRemoteRetrofitDataSource(Dio dio) =
      _ItemsInfoRemoteRetrofitDataSource;

  @GET("/products")
  Future<List<ItemInfoModel>> provideRemoteInfo();
}
