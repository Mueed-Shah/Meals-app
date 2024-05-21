import 'package:flutter/material.dart';
import 'package:meal/Providers/favourite_provider.dart';
import 'package:meal/screen/categories.dart';
import 'package:meal/screen/filter_screen.dart';
import 'package:meal/screen/meals.dart';
import 'package:meal/Widget/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Providers/filter_provider.dart';

final kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int pageIndex = 0;
  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void changeScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FilterScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    String pageTitle = 'Meals Screen';
    Widget activeScreen = CategoriesScreen(
      availableMeal: availableMeals,
    );
    if (pageIndex == 1) {
      final favouriteMeal = ref.watch(favouriteMealProvider);
      activeScreen = MealsScreen(
        meals: favouriteMeal,
      );
      pageTitle = 'Favourite Screen';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      drawer: MainDrawer(onPressed: changeScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
          ]),
    );
  }
}
