import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sneaky_shopper/models/single_sneaker_model.dart';

part 'items_info_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class ItemsInfoRemoteRetrofitDataSource {
  @factoryMethod
  factory ItemsInfoRemoteRetrofitDataSource(Dio dio) =
      _ItemsInfoRemoteRetrofitDataSource;
}

@injectable
class SneakersRemoteDataSource {
  Future<List<SingleSneakerModel>> fetchSneakers() async {
    const apiKey = 'b2de728957msh2d49503da1a1973p198dd2jsn6a23bccaa8ce';
    const apiUrl = 'https://the-sneaker-database.p.rapidapi.com/sneakers';
    final dio = Dio();
    dio.options.headers = {
      'x-rapidapi-host': 'the-sneaker-database.p.rapidapi.com',
      'x-rapidapi-key': apiKey,
    };
    final response = await dio.get(apiUrl);
    try {
      if (response.statusCode == 200) {
        final responseData = response.data['results'];
        print(responseData);
        return responseData
            .map<SingleSneakerModel>(
                (json) => SingleSneakerModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to fetch sneakers: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API');
    }
  }
}
