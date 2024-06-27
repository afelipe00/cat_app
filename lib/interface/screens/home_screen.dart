import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/interface/widgets/widgets.dart';
import 'package:cat_app/resources/models/cat.dart';
import 'package:cat_app/resources/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CatBloc catBloc;
  final double expandedHeight = 180.0;
  final double collapsedHeight = 60.0;
  bool isLoading = false;
  List<Cat> cats = [];

  @override
  void initState() {
    catBloc = BlocProvider.of<CatBloc>(context);
    isLoading = catBloc.state.status == APIStatus.loading;
    catBloc.add(const FetchCatEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final ThemeData theme = Theme.of(context);

    if (catBloc.state is CatLoaded) {
      final CatLoaded catLoaded = catBloc.state as CatLoaded;
      cats = catLoaded.cats;
    } else if (catBloc.state is CatInitial) {
      cats = [
        Cat(),
        Cat(),
      ];
    }

    return Scaffold(
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
        body: BlocListener<CatBloc, CatState>(
          listener: (context, state) {
            final APIStatus catStatus = state.status;
            if (catStatus == APIStatus.loading) {
              setState(() {
                isLoading = true;
              });
              if (state is CatInitial && catStatus == APIStatus.loading) {
                catBloc.add(const FetchCatEvent());
              }
            } else {
              setState(() {
                isLoading = false;
              });
            }
          },
          child: Skeletonizer(
            enabled: isLoading,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        child: InkWell(
                          onTap: () {
                            context.push("${AppRoutes.home}/${AppRoutes.catDetail}/$index");
                          },
                          child: Hero(
                            tag: 'cat$index',
                            child: CarCardWidget(
                              isNetworkImage: isLoading ? false : true,
                              cat: cats[index],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: cats.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
