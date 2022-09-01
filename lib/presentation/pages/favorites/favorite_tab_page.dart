import 'package:flutter/material.dart';

class FavoritesTabPage extends StatelessWidget {
  const FavoritesTabPage({Key? key, required this.listImages})
      : super(key: key);
  final List listImages;

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
              child: Image.asset(
                listImages[index] ?? '',
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: listImages.length,
        ),
      ),
    );
  }
}
