import 'package:flutter/material.dart';
import 'package:ichef/data/models/recipe_model.dart';

import '../../../config/constants/app_colors.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({required this.image, Key? key}) : super(key: key);

  // final RecipeModel model;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
