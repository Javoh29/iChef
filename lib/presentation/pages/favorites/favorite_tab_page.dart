import 'package:flutter/material.dart';
import 'package:ichef/presentation/components/recipe_item.dart';
import 'package:ichef/presentation/routes/routes.dart';

import '../../../config/constants/local_data.dart';
import 'favorites_item.dart';

class FavoritesTabPage extends StatelessWidget {
  const FavoritesTabPage({Key? key, required this.listRecipes})
      : super(key: key);
  final List listRecipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
              // onTap: () => Navigator.pushNamed(
              //   context,
              //   Routes.recipeInfoPage,
              //   arguments: {'recipe_model': listRecipes[index]},
              // ),
              child: Image.asset(
                listRecipes[index].recipeVideo ?? '',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: listRecipes.length,
        ),
      ),
    );
  }
}
