import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatsRepository {
  Future<Either<Exception, List<CatEntity>>> fetchCats();
}