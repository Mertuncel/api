import 'package:dio/dio.dart';

import '../Model/items_model.dart';

class ApiService {
  // users API service
  static const String _usersUrl = 'https://reqres.in/api/users?page=1';

  static Future<List<ItemsModel>> fetchItems() async {
    List<ItemsModel>? _items = [];

    var response = await Dio().get(_usersUrl);

    var datas = response.data['data'];

    if (datas is List) {
      _items = datas.map((e) => ItemsModel.fromJson(e)).toList();
    }

    return _items;
  }
}
