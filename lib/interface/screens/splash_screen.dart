import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/interface/widgets/circle_ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late CatBloc catBloc;

  @override
  void initState() {
    catBloc = BlocProvider.of<CatBloc>(context);
    catBloc.add(InitAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Catbreeds',
                style: theme.textTheme.displaySmall,
              ),
            ),
            CircleRippleButton(
              size: 60,
              color: theme.brightness == Brightness.light
                  ? theme.colorScheme.primary.withOpacity(0.1)
                  : theme.colorScheme.primary.withOpacity(0.2),
              child: Image.asset(
                'assets/images/cat_100.png',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
