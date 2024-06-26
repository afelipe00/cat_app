part of 'cat_bloc.dart';

sealed class CatState extends Equatable {
  const CatState();
  
  @override
  List<Object> get props => [];
}

final class CatInitial extends CatState {}
