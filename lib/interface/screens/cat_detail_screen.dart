import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/interface/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatDetailScreen extends StatelessWidget {
  final int index;
  const CatDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
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
          body: Padding(
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
                const SizedBox(height: 10),
                Center(
                  child: Hero(
                    tag: 'cat$index',
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      return SingleChildScrollView(
                        child: fromHeroContext.widget,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.network(
                        cat.url!,
                        fit: BoxFit.cover,
                        width: size.width * 0.98,
                        height: size.height * 0.35,
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
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatsButton(
                              label: 'Intelligence',
                              width: size.width * 0.3,
                              onPressed: () {},
                              child: Text(
                                cat.breeds?.first.intelligence.toString() ?? "",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: colors.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            StatsButton(
                              label: 'health issues',
                              width: size.width * 0.3,
                              child: Text(
                                cat.breeds?.first.healthIssues.toString() ?? "",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: colors.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              onPressed: () {},
                            ),
                            StatsButton(
                              label: 'adaptability',
                              width: size.width * 0.3,
                              child: Text(
                                cat.breeds?.first.adaptability.toString() ?? "",
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: colors.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Description'),
                          subtitle: Text(cat.breeds?.first.description ?? ""),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Features',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 48.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(Icons.favorite),
                          ),
                          title: const Text('Life Span'),
                          subtitle: Text(cat.breeds?.first.lifeSpan ?? ""),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 48.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(Icons.bolt_rounded),
                          ),
                          title: const Text('Energy Level'),
                          subtitle: Text(cat.breeds?.first.energyLevel.toString() ?? ""),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 48.0,
                            width: 48.0,
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Icon(Icons.pets),
                          ),
                          title: const Text('Social Needs'),
                          subtitle: Text(cat.breeds?.first.socialNeeds.toString() ?? ""),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
