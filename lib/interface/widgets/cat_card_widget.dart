import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({
    super.key,
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
            child: Image.asset(
              'assets/images/cat1_bg.jpg',
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
