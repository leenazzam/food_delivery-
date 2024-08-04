import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Favorites',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favoritesProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 16),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final favproduct = favoritesProducts[index];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              favproduct.imgUrl,
                              height: 90,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              favproduct.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '\$${favproduct.price}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.grey2,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                favoritesProducts.remove(favproduct);
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
