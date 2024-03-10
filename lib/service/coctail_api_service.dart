import 'package:dio/dio.dart';

import '../Model/coctails_model.dart';

class CoctailApi{
 // Coctails API service
  static const String _winesUrl =
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita';

  static Future<List<WinesModel>> fetchWines() async {
    List<WinesModel> _coctails = [];

    var response = await Dio().get(_winesUrl);

    var datas = response.data['drinks'];

    if (datas is List) {
      _coctails = datas.map((e) => WinesModel.fromJson(e)).toList();
    }
    return _coctails;
  }
}