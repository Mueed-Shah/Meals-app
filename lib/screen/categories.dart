import 'package:flutter/material.dart';
import 'package:meal/Category/category.dart';
import 'package:meal/Category/meal.dart';
import 'package:meal/Data/dummy_data.dart';
import 'package:meal/Widget/category_grid_item.dart';
import 'package:meal/screen/meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        upperBound: 1,
        lowerBound: 0);
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // function that will navigate to first basic meal screen
  void _changeCategoryScreen(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeal
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          MealsScreen(title: category.title, meals: filteredMeals),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 0.25), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut)),
        child: child,
      ),
      child: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (var category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategoryScreen: () {
                _changeCategoryScreen(context, category);
              },
            )
        ],
      ),
    );
  }
}
