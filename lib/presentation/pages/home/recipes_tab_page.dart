import 'package:flutter/material.dart';
import 'package:ichef/presentation/components/recipe_item.dart';

import '../../../config/constants/local_data.dart';

class RecipesTabPage extends StatelessWidget {
  const RecipesTabPage({required this.callBack, Key? key}) : super(key: key);
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10, bottom: 80),
      itemBuilder: (context, index) {
        return RecipeItem(
          model: listRecipes[index],
          openDrawer: () => callBack(index),
        );
      },
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Divider(
          color: Color(0xffcccccc),
        ),
      ),
      itemCount: listRecipes.length,
    );
  }
}
