import 'package:dio/dio.dart';

class ItemsRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> provideRemoteDetails() async {
    final response = await Dio().get<List<dynamic>>(
        "https://my-json-server.typicode.com/kubaolszewski/json-demo/products");
    final itemListDynamic = response.data;
    if (itemListDynamic == null) {
      return null;
    }
    return itemListDynamic.map((data) => data as Map<String, dynamic>).toList();
  }
}
