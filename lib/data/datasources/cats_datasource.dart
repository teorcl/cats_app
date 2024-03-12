import 'package:cats_app/data/models/cat_model.dart';
import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:dio/dio.dart';

abstract class CatsDataSource {
  Future<List<CatEntity>> fetchCats();
}

class CatsDataSourceImpl implements CatsDataSource {

  final Dio _client;

  CatsDataSourceImpl({
    required Dio client,
  }) : _client = client;

  @override
  Future<List<CatModel>> fetchCats() async {
    try {
      final response = await _client.get("breeds");
      final jsonResponse = _validateResponse(response) as List;
      return jsonResponse.map((item) => CatModel.fromJson(item)).toList();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  dynamic _validateResponse(Response response){
    if(response.statusCode! >= 200 && response.statusCode! < 300){
      return response.data;
    }
    throw Exception(response.toString());
  }


}