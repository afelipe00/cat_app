import 'package:cat_app/bloc/navigator/navigator_cubit.dart';
import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/resources/models/breed.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final NavigatorCubit navigator;

  CatBloc({required this.navigator}) : super(CatInitial()) {
    on<InitAppEvent>(_onInitAppEvent);
    on<FetchCatEvent>(_onFetchCatEvent);
  }

  void _onInitAppEvent(InitAppEvent event, Emitter<CatState> emit) async {
    // acá se pueden cargar los parámetros iniciales, como verificar si hay un usuario logueado o no
    await Future.delayed(const Duration(milliseconds: 500));
    navigator.push(AppRoutes.home);
    emit(const CatInitial());
  }

  void _onFetchCatEvent(FetchCatEvent event, Emitter<CatState> emit) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    emit(CatLoaded(cats: [Breed()], status: APIStatus.success));
  }
}
