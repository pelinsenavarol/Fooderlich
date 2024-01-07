import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
//1
import '../models/models.dart';
import '../components/components.dart';

class TodayRecipeListView extends StatelessWidget {
  //2
  final List<ExploreRecipe> recipes;

  const TodayRecipeListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //3
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        //4
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //5
          Text('Recipes of the Day 🍳',
              style: Theme.of(context).textTheme.headline2),
          //6
          const SizedBox(height: 16),
          //7
          Container(
            height: 400,
            //1
            color: Colors.transparent,
            //2
            child: ListView.separated(
              //3
              scrollDirection: Axis.horizontal,
              //4
              itemCount: recipes.length,
              //5
              itemBuilder: (context, index) {
                //6
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              //7
              separatorBuilder: (context, index) {
                //8
                return const SizedBox(width: 16);
              },
            ),
          )
        ]));
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesnt\'t exist yet.');
    }
  }
}
