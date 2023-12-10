import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Features/Cart/view/manger/Cart_cubit.dart';
import 'package:kortobaa_task/Features/Cart/view/manger/Cart_state.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/ContinerMyCart.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/ListTileAll.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/Price.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/codeDiscount.dart';
import '../../../Core/Utils/App Colors.dart';
import '../../../Core/Utils/Responsive.dart';
import '../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../Core/Utils/Widgets/LoadingWidget/LoadingWidget.dart';
import '../../../Core/Utils/snackbars.dart';
import '../../../Core/service_locator/service_locator.dart';
import '../data/models/CartProductModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = PageController();double total = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeCartData();
  }

  Future<void> _initializeCartData() async {
    await context.read<CartCubit>().getCartItems();
    await context.read<CartCubit>().getTotal();
    total = context.read<CartCubit>().total;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {


        if (state is removeItemLoaded) {
          ServiceLocator.instance<Snackbars>().success(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        List<CartProduct> products = context.read<CartCubit>().products;

        _initializeCartData();
        return Scaffold(
          appBar: AppBar(
            title: const Text('سلة التسوق'),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          body: state is GetCartItemsLoading
              ? const LoadingWidget(
                  color: AppColors.primaryColor,
                )
              : products.isEmpty
                  ?  Center(
                      child: Text(
                        "لا يوجد منتجات فى السلة",
                        style: AppTextStyles.lrTitles,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            listTile(
                                totalPrice:total.toStringAsFixed(2),
                                items: products.length.toString()),
                            const SizedBox(
                              height: 30,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ContinerMyCart(
                                  context,
                                  removeitem: () {
                                    context
                                        .read<CartCubit>()
                                        .removeItemFromCart(CartProduct(
                                          image: products[index].image,
                                          title: products[index].title,
                                          price: products[index].price,
                                        ));
                                  },
                                  add: () {
                                    context.read<CartCubit>().updateItemCount(
                                        CartProduct(
                                            image: products[index].image,
                                            title: products[index].title,
                                            price: products[index].price,
                                            count: products[index].count ),
                                        products[index].count + 1);
                                  },
                                  remove: () {
                                    products[index].count ==1?null:
                                    context.read<CartCubit>().updateItemCount(
                                        CartProduct(
                                            image: products[index].image,
                                            title: products[index].title,
                                            price: products[index].price,
                                            count: products[index].count ),

                                        products[index].count - 1);
                                  },
                                  image: products[index].image,
                                  title: products[index].title,
                                  price: products[index].price,
                                  totalPrice:
                                      "${double.parse(products[index].price) * products[index].count}",
                                  quantity: products[index].count,
                                );
                              },
                            ),
                            codeDiscount(context),
                             Price(
                              allPrice: total.toStringAsFixed(2),
                              priceRate: "68",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ButtonTemplate(
                                colorText: AppColors.white,
                                width:
                                    MediaQueryHelper.sizeFromWidth(context, 1),
                                color: AppColors.primaryColor,
                                text1: "إتمام الشراء",
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
        );
      },
    );
  }
}
