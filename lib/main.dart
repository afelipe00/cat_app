import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/config/themes/themes.dart';
import 'package:cat_app/resources/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const BlocProviders(),
  );
}

class BlocProviders extends StatefulWidget {
  const BlocProviders({super.key});

  @override
  State<BlocProviders> createState() => _BlocProvidersState();
}

class _BlocProvidersState extends State<BlocProviders> {
  ThemeProvider themeProvider = ThemeProvider();

  @override
  void initState() {
    themeProvider.getThemePreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigatorCubit()),
        BlocProvider(
          create: (context) => CatBloc(
            navigator: BlocProvider.of<NavigatorCubit>(context),
          ),
        ),
      ],
      child: ChangeNotifierProvider.value(
        value: themeProvider,
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    var router = context.watch<NavigatorCubit>().state.router;
    TextTheme textTheme = createTextTheme(context, "Lato", "Noto Sans");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'The Cat App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeProvider.themePreference == ThemePreference.light ? theme.light() : theme.dark(),
    );
  }
}
