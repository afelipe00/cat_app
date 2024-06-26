import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const NavigatorScreen({super.key, required this.navigationShell});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
    );
  }
}
