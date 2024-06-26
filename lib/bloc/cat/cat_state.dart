part of 'cat_bloc.dart';

sealed class CatState extends Equatable {
  final APIStatus status;

  const CatState({this.status = APIStatus.none});

  @override
  List<Object> get props => [];
}

final class CatInitial extends CatState {
  const CatInitial() : super(status: APIStatus.loading);
}

final class CatLoaded extends CatState {
  final List<Breed> cats;

  const CatLoaded({required this.cats, required super.status});

  @override
  List<Object> get props => [cats];
}
