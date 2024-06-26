import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const BlocProviders(),
  );
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigatorCubit()),
        BlocProvider(
            create: (context) => CatBloc(
                  navigator: BlocProvider.of<NavigatorCubit>(context),
                )),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var router = context.watch<NavigatorCubit>().state.router;
    TextTheme textTheme = createTextTheme(context, "Lato", "Noto Sans");
    MaterialTheme theme = MaterialTheme(textTheme);
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    return MaterialApp.router(
      title: 'The Cat App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
    );
  }
}
