import 'package:cat_app/resources/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catbreeds'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
