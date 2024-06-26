part of 'navigator_cubit.dart';

sealed class NavigatorState extends Equatable {
  final GoRouter router;

  const NavigatorState({required this.router});

  @override
  List<Object> get props => [];
}

final class NavigatorInitial extends NavigatorState {
  const NavigatorInitial({required super.router});

  @override
  List<Object> get props => [router];
}
