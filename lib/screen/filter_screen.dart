import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override

  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Screen'),
      ),
      body:Column(
          children: [
            SwitchListTile(
              value: currentFilter[Filter.glutenFree]!,
              onChanged: (onCheck) {
                  ref.read(filterProvider.notifier).setFilter(Filter.glutenFree,onCheck);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
              title: Text(
                'Gluten_Free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('These meals are free of gluten',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
            SwitchListTile(
              value: currentFilter[Filter.lactoseFree]!,
              onChanged: (onCheck) {
                ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, onCheck);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
              title: Text(
                'Lactose_Free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('These meals are free of lactose',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
            SwitchListTile(
              value: currentFilter[Filter.vegetarian]!,
              onChanged: (onCheck) {
                ref.watch(filterProvider.notifier).setFilter(Filter.vegetarian, onCheck);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
              title: Text(
                'Vegetarian Food',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('These are all vegetarian food',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
            SwitchListTile(
              value: currentFilter[Filter.vegan]!,
              onChanged: (onCheck) {
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, onCheck);
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding:const EdgeInsets.only(left: 34,right: 22),
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only include vegan food',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),

            ),
          ],

      )
    );
  }
}
