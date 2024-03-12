import 'package:cats_app/data/models/cat_model.dart';
import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:cats_app/domain/usecases/fetch_cats_use_case.dart';
import 'package:cats_app/presentation/home/cubit/cat_status.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {

  final FetchCatsUseCase _fetchCatsUseCase;

  CatCubit({
    required FetchCatsUseCase fetchCatsUseCase,
  }) : _fetchCatsUseCase = fetchCatsUseCase,
        super(CatState.initialState());

  Future<void> getData() async {
    emit(
      state.copyWith(
        status: CatStatus.loading,
      ),
    );

    final responseBox = await _fetchCatsUseCase(unit);

    final response = responseBox.fold(
          (exception) => exception,
          (cats) => cats,
    );

    if (responseBox.isLeft()) {
      emit(
        state.copyWith(
          status: CatStatus.error,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: CatStatus.loaded,
        cats: response as List<CatEntity>,
        fullCatsList: response,
      ),
    );

  }

  Future<void> searchCat(String value, BuildContext context) async {

    emit(
        state.copyWith(
          status: CatStatus.loading,
        )
    );

    final filteredCats = state.cats!.where((cat) =>
        cat.name.toLowerCase().contains(value.toLowerCase())).toList();

    if (filteredCats.isNotEmpty && value.isNotEmpty) {
      emit(
        state.copyWith(
          status: CatStatus.loaded,
          cats: filteredCats,
        ),
      );
    } else {
      emit(
        state.copyWith(
          cats: state.fullCatsList,
          status: CatStatus.loaded,
        ),
      );
    }

  }
}
