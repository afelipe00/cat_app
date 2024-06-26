import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/router.dart';

part 'navigator_state.dart';

class NavigatorCubit extends Cubit<NavigatorState> {
  NavigatorCubit() : super(NavigatorInitial(router: router));

  void pop() => state.router.pop();

  void push(String location, {Object? extra}) => state.router.push(location, extra: extra);

  void go(String location, {Object? extra}) => state.router.go(location, extra: extra);
}
