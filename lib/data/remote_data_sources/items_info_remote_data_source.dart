import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'items_info_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class ItemsInfoRemoteRetrofitDataSource {
  @factoryMethod
  factory ItemsInfoRemoteRetrofitDataSource(Dio dio) =
      _ItemsInfoRemoteRetrofitDataSource;
}
