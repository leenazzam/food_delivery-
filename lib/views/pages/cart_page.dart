import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/product_model.dart';
import 'package:food/utils/appcolors.dart';
import 'package:food/views/widgets/counter_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late ProductModel product;
  double cartprice = 0;
  int cartcount = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        backgroundColor: AppColors.grey100,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(13),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 15,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartProducts.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartProducts[index];
                            cartprice += cartItem.prices;
                            cartcount += cartItem.count;
                            product = cartItem;
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(size.width * 0.01),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: cartItem.imgUrl,
                                            width: size.width * 0.25,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cartItem.name,
                                                  style: TextStyle(
                                                    fontSize: size.width > 1200
                                                        ? size.aspectRatio * 10
                                                        : orientation ==
                                                                Orientation
                                                                    .landscape
                                                            ? size.aspectRatio *
                                                                10
                                                            : size.aspectRatio *
                                                                30,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  cartItem.category.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  '${cartItem.prices.toStringAsFixed(2)} \$',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                        fontSize: size.width >
                                                                1200
                                                            ? size.aspectRatio *
                                                                10
                                                            : orientation ==
                                                                    Orientation
                                                                        .landscape
                                                                ? size.aspectRatio *
                                                                    10
                                                                : size.aspectRatio *
                                                                    30,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          CounterWidget(
                                            product: cartItem,
                                            onQuantityChanged: () {
                                              setState(() {});
                                            },
                                          ),
                                        ],
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
                                                cartProducts.remove(cartItem);
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
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
                            '\$${cartprice.toStringAsFixed(1)}',
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
                            onPressed: () {},
                            child: Text('Checkout (${cartcount.toString()})'),
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
      ),
    );
  }
}
