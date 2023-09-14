import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    var themeCtx = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    themeCtx.colorScheme.primaryContainer,
                    themeCtx.colorScheme.primaryContainer.withOpacity(0.8)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: themeCtx.colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    "Cooking Up!",
                    style: themeCtx.textTheme.titleLarge!
                        .copyWith(color: themeCtx.colorScheme.primary),
                  )
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: themeCtx.colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: themeCtx.textTheme.titleSmall!.copyWith(
                  color: themeCtx.colorScheme.onBackground, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: themeCtx.colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: themeCtx.textTheme.titleSmall!.copyWith(
                  color: themeCtx.colorScheme.onBackground, fontSize: 24),
            ),
            onTap: () {
              onSelectScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
