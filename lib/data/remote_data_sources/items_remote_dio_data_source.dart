import 'package:dio/dio.dart';

class ItemsRemoteDioDataSource {
  Future<Map<String,dynamic>?> getRemoteData() async {
    final response = await Dio()
        .get('https://my-json-server.typicode.com/kubaolszewski/json-demo/db');
    return response.data;
  }
}
