import 'package:cat_app/config/constants/routes.dart';
import 'package:cat_app/interface/widgets/circle_ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.push(AppRoutes.home);
      }),
    );
  }
}
