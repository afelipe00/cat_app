import 'package:cat_app/bloc/navigator/navigator_cubit.dart';
import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/resources/models/cat.dart';
import 'package:cat_app/resources/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final NavigatorCubit navigator;
  final CatService _catService = CatService();

  CatBloc({required this.navigator}) : super(const CatInitial()) {
    on<InitAppEvent>(_onInitAppEvent);
    on<FetchCatEvent>(_onFetchCatEvent);
    on<SearchCatEvent>(_onSearchCatEvent);
  }

  void _onInitAppEvent(InitAppEvent event, Emitter<CatState> emit) async {
    // acá se pueden cargar los parámetros iniciales, como verificar si hay un usuario logueado o no
    await Future.delayed(const Duration(milliseconds: 500));
    navigator.go(AppRoutes.home);
    emit(const CatInitial());
  }

  void _onFetchCatEvent(FetchCatEvent event, Emitter<CatState> emit) async {
    List<Cat> req = await _catService.getCatBreeds();
    emit(CatLoaded(cats: req, status: APIStatus.success));
  }

  void _onSearchCatEvent(SearchCatEvent event, Emitter<CatState> emit) async {
    emit(const CatLoading());
    List<Cat> req = await _catService.searchCatBreeds(event.query);
    emit(CatLoaded(cats: req, status: APIStatus.success));
  }
}
