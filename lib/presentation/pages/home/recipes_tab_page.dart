import 'package:flutter/material.dart';
import 'package:ichef/presentation/components/recipe_item.dart';

import '../../../config/constants/local_data.dart';

class RecipesTabPage extends StatelessWidget {
  const RecipesTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10, bottom: 80),
      itemBuilder: (context, index) {
        return RecipeItem(model: listRecipes[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: listRecipes.length,
    );
  }
}
