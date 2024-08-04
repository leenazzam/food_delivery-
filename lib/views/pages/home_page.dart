import 'package:flutter/material.dart';
import 'package:food/models/category_model.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/food_banner.jpg')),
            const SizedBox(height: 36),
            SizedBox(
              height: 120,
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
                                padding: const EdgeInsets.all(16.0),
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
                                        style: TextStyle(
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
              height: 36,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 16),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final product = filteredProducts[index];
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
                              product.imgUrl,
                              height: 90,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '\$${product.price}',
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
            ),
          ],
        ),
      ),
    );
  }
}
