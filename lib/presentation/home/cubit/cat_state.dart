part of 'cat_cubit.dart';

class CatState extends Equatable {

  final CatStatus status;
  final List<CatEntity>? cats;
  final List<CatEntity>? fullCatsList;
  final String? errorMessage;
  final CatEntity? cat;

  const CatState(  {
    required this.status,
    this.cats,
    this.errorMessage,
    this.cat,
    this.fullCatsList,
  });

  factory CatState.initialState() =>
      const CatState(status: CatStatus.initial);

  CatState copyWith({
    CatStatus? status,
    List<CatEntity>? cats,
    String? errorMessage,
    CatEntity? cat,
    List<CatEntity>? fullCatsList,
  }) =>
      CatState(
        status: status ?? this.status,
        cats: cats ?? this.cats,
        errorMessage: errorMessage ?? this.errorMessage,
        cat: cat ?? this.cat,
        fullCatsList: fullCatsList ?? this.fullCatsList,
      );

  @override
  List<Object?> get props => [
    status,
    cats,
    errorMessage,
    cat,
    fullCatsList,
  ];

}

