import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/interface/widgets/widgets.dart';
import 'package:cat_app/resources/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    double expandedHeight = 180.0; // TODO reviar si debe estar acá
    double collapsedHeight = 60.0;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Catbreeds'),
      //   centerTitle: true,
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(50.0),
      //     child: Container(
      //       padding: EdgeInsets.all(10.0),
      //       child: TextField(
      //         decoration: InputDecoration(
      //           hintText: 'Search',
      //           prefixIcon: Icon(Icons.search),
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(12.0),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                'Catbreeds',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              stretch: true,
              pinned: true,
              expandedHeight: expandedHeight,
              collapsedHeight: collapsedHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.black,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/cat1_bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    themeProvider.themePreference == ThemePreference.light ? Icons.light_mode : Icons.dark_mode,
                  ),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                ),
              ],
            )
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: InkWell(
                      onTap: () {
                        context.push("${AppRoutes.home}/${AppRoutes.catDetail}");
                      },
                      child: CarCardWidget(),
                    ),
                  );
                },
                childCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
