import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Category/meal.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealNotifier():super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if(mealIsFavourite){
      state = state.where((element)=>element.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state,meal];
      return true;
    }
  }
}
final favouriteMealProvider = StateNotifierProvider<FavouriteMealNotifier,List<Meal>>((ref){
  return FavouriteMealNotifier();
});