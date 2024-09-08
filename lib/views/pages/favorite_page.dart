import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/product_details_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final orientation = MediaQuery.of(context).orientation;
    var categoryTextScaler =
        textScaler.clamp(minScaleFactor: 0.1, maxScaleFactor: 2);
    var productTextScaler =
        textScaler.clamp(minScaleFactor: 0.1, maxScaleFactor: 1);
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: size.width > 1200
                      ? 6
                      : size.width > 800
                          ? 4
                          : 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final favproduct = favoritesProducts[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                      return ProductDetailsPage(
                        product: favproduct,
                      );
                    }));
                  },
                  child: LayoutBuilder(builder: (context, constrains) {
                    final maxHeight = constrains.maxHeight;

                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(maxHeight * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: favproduct.imgUrl,
                                  height: maxHeight * 0.6,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: maxHeight * 0.01,
                                ),
                                FittedBox(
                                  child: SizedBox(
                                    height: maxHeight * 0.18,
                                    child: Text(favproduct.name,
                                        textScaler: productTextScaler,
                                        // maxLines: 1,
                                        // overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontSize: size.width > 1200
                                                  ? size.aspectRatio * 10
                                                  : orientation ==
                                                          Orientation.landscape
                                                      ? size.aspectRatio * 10
                                                      : size.aspectRatio * 30,
                                              fontWeight: FontWeight.w600,
                                            )),
                                  ),
                                ),
                                SizedBox(
                                  height: maxHeight * 0.01,
                                ),
                                SizedBox(
                                  height: maxHeight * 0.18,
                                  child: Text('\$${favproduct.price}',
                                      textScaler: productTextScaler,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: size.width > 1200
                                                ? size.aspectRatio * 10
                                                : orientation ==
                                                        Orientation.landscape
                                                    ? size.aspectRatio * 10
                                                    : size.aspectRatio * 30,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
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
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
