import 'package:flutter/material.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Detail'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Image.asset(
              'assets/images/cat1_bg.jpg',
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Cat Name',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
