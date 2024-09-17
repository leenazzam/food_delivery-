import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/pages/cart_page.dart';
import 'package:food/views/widgets/counter_widget.dart';
import 'package:food/views/widgets/property_item.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  void initstate() {
    widget.product.prices = widget.product.price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (favoritesProducts.contains(widget.product)) {
                      favoritesProducts.remove(widget.product);
                    } else {
                      favoritesProducts.add(widget.product);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    favoritesProducts.contains(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: AppColors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.grey2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60),
                          child: CachedNetworkImage(
                              imageUrl: widget.product.imgUrl),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          height: 8,
                          width: 70,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(8)),
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.product.category.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: AppColors.grey,
                                        ),
                                  ),
                                ],
                              ),
                              CounterWidget(
                                product: widget.product,
                                onQuantityChanged: () {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PropertyItem(title: 'Size', value: 'Medium'),
                              SizedBox(
                                  height: 35,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: AppColors.grey,
                                  )),
                              PropertyItem(title: 'Calories', value: '150Kcal'),
                              SizedBox(
                                  height: 35,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: AppColors.grey,
                                  )),
                              PropertyItem(title: 'Cooking', value: '5-10Min'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.product.description,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: AppColors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 76,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$${widget.product.prices.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (cartProducts.contains(widget.product)) {
                                widget.product.count++;
                              } else {
                                cartProducts.add(widget.product);
                              }
                            });
                            Navigator.of(context)
                                .push(CupertinoPageRoute(builder: (_) {
                              return CartPage();
                            }));
                          },
                          child: Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
