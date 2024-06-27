import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/interface/widgets/widgets.dart';
import 'package:cat_app/repository/models/cat_model.dart';
import 'package:cat_app/repository/providers/theme_provider.dart';
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
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  bool isLoading = true;
  List<CatModel> cats = [];

  @override
  void initState() {
    catBloc = BlocProvider.of<CatBloc>(context);
    catBloc.add(const FetchCatEvent(
      order: GetCatMode.descendent,
      page: 0,
    ));
    cats = [
      CatModel(),
      CatModel(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    double triggerChangeColor = 30.0;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverLayoutBuilder(builder: (context, constraints) {
              return SliverAppBar(
                title: Text(
                  'Catbreeds',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: themeProvider.themePreference == ThemePreference.light
                        ? constraints.scrollOffset > triggerChangeColor
                            ? colors.onPrimaryContainer
                            : colors.onPrimary
                        : null,
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
                actions: [
                  IconButton(
                    icon: Icon(
                      themeProvider.themePreference == ThemePreference.light ? Icons.light_mode : Icons.dark_mode,
                      color: themeProvider.themePreference == ThemePreference.light
                          ? constraints.scrollOffset > triggerChangeColor
                              ? colors.onPrimaryContainer
                              : colors.onPrimary
                          : null,
                    ),
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (query) {
                        if (query.isEmpty || query == "") {
                          catBloc.add(const FetchCatEvent(
                            order: GetCatMode.descendent,
                            page: 0,
                          ));
                        } else if (query.length > 2) {
                          catBloc.add(SearchCatEvent(query: query));
                        }
                      },
                      style: TextStyle(
                        color: themeProvider.themePreference == ThemePreference.light
                            ? constraints.scrollOffset > triggerChangeColor
                                ? colors.onPrimaryContainer
                                : colors.onPrimary
                            : null,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: theme.textTheme.bodyLarge!.copyWith(
                          color: themeProvider.themePreference == ThemePreference.light
                              ? constraints.scrollOffset > triggerChangeColor
                                  ? colors.onPrimaryContainer
                                  : colors.onPrimary
                              : null,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: themeProvider.themePreference == ThemePreference.light
                              ? constraints.scrollOffset > triggerChangeColor
                                  ? colors.onPrimaryContainer
                                  : colors.outline
                              : null,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })
          ];
        },
        body: BlocListener<CatBloc, CatState>(
          listener: (context, state) {
            if (state is CatLoaded) {
              cats = state.cats;
              setState(() {
                isLoading = false;
              });
            } else if (state is CatLoading) {
              setState(() {
                isLoading = true;
              });
            }
          },
          child: RefreshIndicator(
            onRefresh: () {
              catBloc.add(const FetchCatEvent(
                order: GetCatMode.descendent,
                page: 0,
              ));
              return Future.delayed(const Duration(seconds: 1));
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
      ),
    );
  }
}
