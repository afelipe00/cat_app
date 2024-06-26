part of 'cat_bloc.dart';

sealed class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object> get props => [];
}

final class InitAppEvent extends CatEvent {}

final class FetchCatEvent extends CatEvent {
  const FetchCatEvent();

  @override
  List<Object> get props => [];
}

final class SearchCatEvent extends CatEvent {
  final String query;

  const SearchCatEvent(this.query);

  @override
  List<Object> get props => [query];
}
