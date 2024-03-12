import 'package:cats_app/data/datasources/cats_datasource.dart';
import 'package:cats_app/data/repositories/cats_repository_impl.dart';
import 'package:cats_app/domain/repositories/cats_repository.dart';
import 'package:cats_app/domain/usecases/fetch_cats_use_case.dart';
import 'package:cats_app/presentation/home/cubit/cat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  //cubit
  serviceLocator.registerLazySingleton<CatCubit>(
        () => CatCubit(
      fetchCatsUseCase: serviceLocator(),
    ),
  );

  //use case
  serviceLocator.registerLazySingleton<FetchCatsUseCase>(
    () => FetchCatsUseCase(
      repository: serviceLocator(),
    ),
  );

  //repository
  serviceLocator.registerLazySingleton<CatsRepository>(
    () => CatsRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  //dataSources
  serviceLocator.registerLazySingleton<CatsDataSource>(
    () => CatsDataSourceImpl(
      client: serviceLocator(),
    ),
  );

  //external
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1/',
      headers: {
        'Content-Type':'application/json',
        'x-api-key':'live_7T9ZZP5E7Y4pikC2bJiLsmnbalpkh4c0nz7eSbBSYbVdZI8A3YmyF85W21gi0Z0E',
      },
    ),
  );
  serviceLocator.registerLazySingleton<Dio>(() => dio);
}