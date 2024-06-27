import 'package:cat_app/bloc/bloc.dart';
import 'package:cat_app/config/constants/constants.dart';
import 'package:cat_app/interface/widgets/widgets.dart';
import 'package:cat_app/repository/models/cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  late CatBloc catBloc;
  bool isLoaded = true;
  bool exitApp = false;
  CatModel? cat;

  @override
  void initState() {
    catBloc = BlocProvider.of<CatBloc>(context);
    catBloc.add(const FetchCatEvent(
      order: GetCatMode.random,
      page: 0,
      limit: 1,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Random'),
        ),
        body: SafeArea(
          child: Center(
            child: BlocListener<CatBloc, CatState>(
              listener: (context, state) {
                if (state is CatLoaded) {
                  setState(() {
                    cat = state.cats.first;
                    isLoaded = false;
                  });
                }
              },
              child: Skeletonizer(
                enabled: isLoaded,
                child: ParallaxCard(
                  height: size.height * 0.6,
                  width: size.width * 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: cat != null
                          ? DecorationImage(
                              image: NetworkImage(cat!.url!),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: AssetImage('assets/images/cat1_bg.jpg'),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            catBloc.add(const FetchCatEvent(
              order: GetCatMode.random,
              page: 0,
              limit: 1,
            ));
          },
          child: const Icon(Icons.replay_rounded),
        ),
      ),
    );
  }
}
