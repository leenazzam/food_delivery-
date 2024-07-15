import 'package:flutter/material.dart';
import 'package:food/models/category_model.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  category.imgUrl,
                                  color: AppColors.black,
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(category.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey))
                              ],
                            ),
                          )),
                    );
                  }),
            ),
            const SizedBox(
              height: 36,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dummyProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 16),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final product = dummyProducts[index];
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
