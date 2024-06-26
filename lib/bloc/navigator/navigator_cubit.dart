import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorState> {
  NavigatorCubit() : super(NavigatorInitial());
}
