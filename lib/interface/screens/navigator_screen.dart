import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const NavigatorScreen({super.key, required this.navigationShell});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
        },
        indicatorColor: colors.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.screen_rotation_alt_rounded),
            label: "Random",
          ),
          NavigationDestination(
            icon: Icon(_selectedIndex == 1 ? Icons.home : Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(_selectedIndex == 2 ? Icons.person_rounded : Icons.person_outline_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
