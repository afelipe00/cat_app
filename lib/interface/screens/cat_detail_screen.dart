import 'package:cat_app/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatDetailScreen extends StatelessWidget {
  final int index;
  const CatDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CatBloc, CatState>(
      builder: (context, state) {
        final cats = (state as CatLoaded).cats;
        final cat = cats[index];

        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.network(
                    cat.url!,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.4,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          cat.breeds?.first.name ?? 'Unknown Breed',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          cat.breeds?.first.origin.toString() ?? "",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Description'),
                          subtitle: Text(cat.breeds?.first.description ?? ""),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
