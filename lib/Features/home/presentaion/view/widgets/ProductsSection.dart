import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/Navigater.dart';
import 'package:kortobaa_task/Features/Cart/data/models/CartProductModel.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/manger/home_cubit.dart';

import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../../../product/view/view.dart';
import '../../data/models/home_response.dart';
import 'product_item.dart';

class ProductsSection extends StatelessWidget {
  final HomeResponse? homeData;
  final List<Product> allProducts;

  ProductsSection({required this.homeData, required this.allProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          'وصل حديث',
                          style: AppTextStyles.boldTitles.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        'عرض الكل',
                        style: AppTextStyles.boldTitles.copyWith(
                          fontSize: 16,
                          color: AppColors.mediumGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: MediaQueryHelper.sizeFromHeight(context, 3.1),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      for (var result in homeData!.results!) {
                        allProducts.add(Product(
                          id: result.id,
                          name: result.name.toString(),
                          price: result.price.toString(),
                          image: result.imageLink.toString(),
                        ));
                      }

                      final product = homeData!.results![index];

                      final isFavorite = context
                          .read<HomeCubit>()
                          .favoriteResults
                          .any((p) => p.id == product.id);

                      return ProductItem(
                        model: homeData,
                        index: index,
                        isFavorite:
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                        //Add to Favorites

                        ontapFavorites: () {
                          int? resultId = homeData!.results![index].id;
                          context.read<HomeCubit>().toggleFavorite(resultId!);
                          print(homeData!.results![index].id);
                        },

                        //to Navigate

                        ontapnavigate: () {
                          navigateTo(
                            context,
                            ProductScreen(
                              id: homeData!.results![index].id,
                            ),
                          );
                        },
                        //Add to cart
                        ontapAddCart: () {

                          context.read<HomeCubit>().addItemToCart(CartProduct(
                            count: 1??0,
                              image: homeData!.results![index].imageLink
                                  .toString(),
                              title: homeData!.results![index].name
                                  .toString(),
                              price:
                                  homeData!.results![index].price.toString()));
                        },
                      );
                    },
                    separatorBuilder: (context, x) {
                      return SizedBox(
                        width: MediaQueryHelper.sizeFromWidth(context, 30),
                      );
                    },
                    itemCount: homeData!.results!.length,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
          itemCount: 1,
        ),
      ],
    );
  }
}
