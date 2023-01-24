import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sneaky_shopper/models/item_info_model.dart';

part 'items_info_remote_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/kubaolszewski/json-demo/")
abstract class ItemsInfoRemoteRetrofitDataSource {
  factory ItemsInfoRemoteRetrofitDataSource(Dio dio, {String baseUrl}) = _ItemsInfoRemoteRetrofitDataSource;

  @GET("/products")
  Future<List<ItemInfoModel>> provideRemoteInfo();
}
