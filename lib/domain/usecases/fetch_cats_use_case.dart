import 'package:cats_app/core/usecase.dart';
import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';
import 'package:dartz/dartz.dart';

class FetchCatsUseCase implements UseCase<List<CatEntity>, Unit> {

  final CatsRepository _repository;

  FetchCatsUseCase({required CatsRepository repository}) : _repository = repository;

  @override
  Future<Either<Exception, List<CatEntity>>> call(Unit params) {
    return _repository.fetchCats();
  }

}