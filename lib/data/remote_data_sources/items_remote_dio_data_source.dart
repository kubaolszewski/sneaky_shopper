import 'package:dio/dio.dart';

class ItemsInfoRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> provideRemoteInfo() async {
    final response = await Dio().get<List<dynamic>>(
        "https://my-json-server.typicode.com/kubaolszewski/json-demo/products");
    final itemInfoListDynamic = response.data;
    if (itemInfoListDynamic == null) {
      return null;
    }
    return itemInfoListDynamic.map((data) => data as Map<String, dynamic>).toList();
  }
}
