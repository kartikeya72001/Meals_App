import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          "Nothing to See here Yet🙃....Save Meals",
          style: Theme.of(context).textTheme.title,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favouriteMeals[idx].id,
            title: favouriteMeals[idx].title,
            affordability: favouriteMeals[idx].affordability,
            complexity: favouriteMeals[idx].complexity,
            duration: favouriteMeals[idx].duration,
            imgUrl: favouriteMeals[idx].imgUrl,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
