import 'package:cat_app/bloc/navigator/navigator_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final NavigatorCubit navigator;

  CatBloc({required this.navigator}) : super(CatInitial()) {
    on<CatEvent>((event, emit) {});
  }
}
