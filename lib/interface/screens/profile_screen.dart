import 'package:cat_app/resources/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: BoxDecoration(
              color: themeProvider.themePreference == ThemePreference.light ? colors.primary : colors.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(42),
                bottomRight: Radius.circular(42),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 28.0),
                Container(
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.surface,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: themeProvider.themePreference == ThemePreference.light
                        ? colors.primaryContainer
                        : colors.primary,
                    backgroundImage: const NetworkImage("https://picsum.photos/200/300.jpg"),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Username',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: themeProvider.themePreference == ThemePreference.light
                            ? colors.onPrimary
                            : colors.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'profile description here',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: themeProvider.themePreference == ThemePreference.light
                            ? colors.onPrimary
                            : colors.onPrimaryContainer,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: themeProvider.themePreference == ThemePreference.light
                            ? colors.onPrimary
                            : colors.onPrimaryContainer,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: themeProvider.themePreference == ThemePreference.light
                            ? colors.onPrimary
                            : colors.onPrimaryContainer,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ExpansionTile(
                      title: const Text("General"),
                      leading: const Icon(Icons.person),
                      controlAffinity: ListTileControlAffinity.leading,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                          child: Card(
                            shadowColor: Colors.transparent,
                            elevation: 0.5,
                            child: ListTile(
                              leading: Icon(
                                themeProvider.themePreference == ThemePreference.light
                                    ? Icons.dark_mode
                                    : Icons.light_mode,
                                color: colors.primary,
                              ),
                              title: Text(
                                'Modo oscuro',
                                style: TextStyle(
                                  fontFamily: "Boston",
                                  fontWeight: FontWeight.normal,
                                  color: colors.primary,
                                  fontSize: 14.0,
                                ),
                              ),
                              trailing: Switch(
                                value: themeProvider.themePreference == ThemePreference.light ? false : true,
                                onChanged: (value) {
                                  themeProvider.toggleTheme();
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
