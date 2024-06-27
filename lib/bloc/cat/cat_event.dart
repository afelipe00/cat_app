part of 'cat_bloc.dart';

sealed class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object> get props => [];
}

final class InitAppEvent extends CatEvent {}

final class FetchCatEvent extends CatEvent {
  final int limit;
  final GetCatMode order;
  final int page;
  const FetchCatEvent({
    this.order = GetCatMode.random,
    this.page = 0,
    this.limit = 10,
  });

  @override
  List<Object> get props => [];
}

final class SearchCatEvent extends CatEvent {
  final String query;

  const SearchCatEvent({required this.query});

  @override
  List<Object> get props => [query];
}
