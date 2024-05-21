import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onPressed});
  final Function(String identifier) onPressed;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.onPrimaryContainer,
                Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.8),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          ),
          ListTiles(icon: Icons.restaurant, title: 'Meals',onPressed: onPressed,titleName: 'meal'),
          ListTiles(icon: Icons.settings, title: 'Filters',onPressed: onPressed,titleName: 'filter',)
        ],
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({super.key, required this.icon, required this.title,required this.onPressed,required this.titleName});
  final IconData icon;
  final String title;
  final String titleName;
  final void Function(String identifier) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 24, color: Theme.of(context).colorScheme.onBackground),
      ),
      onTap: (){onPressed(titleName);},
    );
  }
}
