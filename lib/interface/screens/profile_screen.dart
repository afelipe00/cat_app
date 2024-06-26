import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(42),
                bottomRight: Radius.circular(42),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: colors.primary,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
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
                            Icons.dark_mode_outlined,
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
                            value: false,
                            onChanged: (value) {},
                            activeColor: colors.primary,
                            activeTrackColor: colors.primary.withOpacity(0.5),
                            inactiveThumbColor: colors.primary.withOpacity(0.5),
                            inactiveTrackColor: colors.primary.withOpacity(0.5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
