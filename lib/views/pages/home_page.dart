import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/models/category_model.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<ProductModel> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = dummyProducts;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScaler = MediaQuery.of(context).textScaler;
    final orientation = MediaQuery.of(context).orientation;
    var categoryTextScaler =
        textScaler.clamp(minScaleFactor: 0.1, maxScaleFactor: 2);
    var productTextScaler =
        textScaler.clamp(minScaleFactor: 0.1, maxScaleFactor: 1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/food_banner.jpg',
                  height: size.width > 1000
                      ? size.height * 0.5
                      : orientation == Orientation.landscape
                          ? size.height * 0.6
                          : size.height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            const SizedBox(height: 30),
            SizedBox(
              height: size.width > 1000
                  ? size.height * 0.3
                  : orientation == Orientation.landscape
                      ? size.height * 0.31
                      : size.height * 0.16,
              child: ListView.builder(
                  itemCount: dummyCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final category = dummyCategories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedCategoryId == category.id) {
                                selectedCategoryId = null;
                                filteredProducts = dummyProducts;
                              } else {
                                selectedCategoryId = category.id;
                                filteredProducts = dummyProducts
                                    .where((product) =>
                                        product.category.id ==
                                        selectedCategoryId)
                                    .toList();
                              }
                            });
                          },
                          child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: selectedCategoryId == category.id
                                    ? AppColors.primary
                                    : AppColors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      category.imgUrl,
                                      color: selectedCategoryId == category.id
                                          ? AppColors.white
                                          : AppColors.black,
                                      height: 50,
                                      width: 50,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(category.name,
                                        textScaler: categoryTextScaler,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              selectedCategoryId == category.id
                                                  ? AppColors.white
                                                  : AppColors.black,
                                        ))
                                  ],
                                ),
                              )),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
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
                final product = filteredProducts[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                      return ProductDetailsPage(
                        product: product,
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
                                  imageUrl: product.imgUrl,
                                  height: maxHeight * 0.6,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  height: maxHeight * 0.01,
                                ),
                                FittedBox(
                                  child: SizedBox(
                                    height: maxHeight * 0.18,
                                    child: Text(product.name,
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
                                  child: Text('\$${product.price}',
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
                            top: 8,
                            right: 8,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.grey2,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (favoritesProducts.contains(product)) {
                                      favoritesProducts.remove(product);
                                    } else {
                                      favoritesProducts.add(product);
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(
                                    favoritesProducts.contains(product)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
