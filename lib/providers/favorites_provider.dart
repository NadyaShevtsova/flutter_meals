import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //[] we are passing an empty list
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);

    // state holdes your data, in this case it's a list of meals
    // add or remove will not be allowed here
    // instead reassigne it
    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
