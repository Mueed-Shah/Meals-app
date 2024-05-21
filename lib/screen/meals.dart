import 'package:flutter/material.dart';
import 'package:meal/Category/meal.dart';
import 'package:meal/Widget/meal_grid_item.dart';
import 'package:meal/screen/meal_details.dart';


class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  // display the detail meal screen
  void selectMeal(Meal meal,BuildContext context ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailScreen(meal: meal),));
  }
  @override

  Widget build(BuildContext context) {

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(
            'Uh...oh! Nothing here',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Try to select another meal',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
    if(meals.isNotEmpty){
      content=ListView.builder(itemBuilder: (ctx,index)=>MealGridItem(meal: meals[index],
          onSelectMeal: (meal){selectMeal(meal, context);}),
        itemCount: meals.length,
      );
    }


    return (title==null)? content:
      Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
