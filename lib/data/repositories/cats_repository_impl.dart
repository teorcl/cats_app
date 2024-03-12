import 'package:cats_app/data/datasources/cats_datasource.dart';
import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';
import 'package:dartz/dartz.dart';

class CatsRepositoryImpl extends CatsRepository {

  final CatsDataSource _dataSource;

  CatsRepositoryImpl({required CatsDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Exception, List<CatEntity>>> fetchCats() async{
    try {
      final response = await _dataSource.fetchCats();
      return Right(response);
    } catch (error) {
      return Left(Exception(error.toString()));
    }
  }

}