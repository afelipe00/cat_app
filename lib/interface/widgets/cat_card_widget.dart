import 'package:cat_app/resources/models/cat.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final Cat cat;
  const CarCardWidget({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.network(
              cat.url ?? '',
              fit: BoxFit.cover,
            ),
          ),
          const ListTile(
            title: Text('Cat'),
            subtitle: Text('This is a cat breed'),
          ),
        ],
      ),
    );
  }
}
