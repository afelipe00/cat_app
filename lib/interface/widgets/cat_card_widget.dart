import 'package:cat_app/resources/models/cat.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  final bool isNetworkImage;
  final Cat cat;
  const CarCardWidget({
    super.key,
    required this.cat,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          isNetworkImage
              ? ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.network(
                    cat.url ?? '',
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    'assets/images/cat1_bg.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
          ListTile(
            title: Text(
              cat.breeds?[0].name ?? 'Unknown',
            ),
            subtitle: Text(
              cat.breeds?[0].origin ?? 'Unknown',
            ),
          ),
        ],
      ),
    );
  }
}
