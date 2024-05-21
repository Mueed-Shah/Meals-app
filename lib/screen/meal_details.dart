import 'package:flutter/material.dart';
import 'package:meal/Category/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Providers/favourite_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favourite = ref.watch(favouriteMealProvider);
    final isAdded = favourite.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),

        actions: [
          IconButton(onPressed: () {

          final wasAdded= ref.read(favouriteMealProvider.notifier).toggleMealFavouriteStatus(meal);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(wasAdded ? 'Added to favourite meals':'Removed from favourite'),
          ));

        },
            icon: AnimatedSwitcher(
              duration:const Duration(milliseconds: 300),
              
              transitionBuilder: (child,animation){
                
                return RotationTransition(turns: Tween<double>(begin: 0,end: 0.5).animate(animation),child: child);
              },
              child:Icon(isAdded?Icons.star:Icons.star_border,key: ValueKey(favourite),),
            ) ,
            )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.ingredients)
              Text(step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            const SizedBox(
              height: 16,
            ),
            Text('Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              ),
          ],
        ),
      ),
    );
  }
}
