import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Features/product/view/widgets/containerCont.dart';
import 'package:kortobaa_task/Features/product/view/widgets/containerShear&favorit.dart';
import '../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';
import '../../../Core/Utils/Widgets/LoadingWidget/LoadingWidget.dart';
import '../../../Core/Utils/Widgets/MessageWidget/MessageWidget.dart';
import '../../../Core/Utils/snackbars.dart';
import '../../../Core/service_locator/service_locator.dart';
import '../../Cart/data/models/CartProductModel.dart';
import '../../home/presentaion/view/manger/home_cubit.dart';
import '../../home/presentaion/view/manger/home_state.dart';
import 'manger/Product_cubit.dart';
import 'manger/Product_state.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.id}) : super(key: key);
  final int? id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = PageController();
  late int _cont = 1;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..getProduct(widget.id),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, Homestate) {
          if (Homestate is AddItemCart) {
            ServiceLocator.instance<Snackbars>().success(
              context: context,
              message: Homestate.message,
            );
          }
        },
        builder: (context, state) {
          return BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
              print(state);
            },
            builder: (context, state) {
              final productData = context.read<ProductCubit>().productResponse;
              return Scaffold(
                appBar: AppBar(),
                body: state is ProductLoading
                    ? const LoadingWidget(
                        color: AppColors.primaryColor,
                      )
                    : state is ProductError
                        ? MessageWidget(message: state.message.toString())
                        : SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            child: Column(
                              children: [
                                Container(
                                  height: MediaQueryHelper.sizeFromHeight(
                                      context, 1.8),
                                  width: MediaQueryHelper.sizeFromWidth(
                                      context, 1),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(.05),
                                            blurRadius: 4,
                                            offset:  const Offset(4, 8),
                                            spreadRadius: 5)
                                      ]),
                                  child: Column(children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          productData!.imageLink.toString(),
                                      fit: BoxFit.cover,
                                      height: MediaQueryHelper.sizeFromHeight(
                                          context, 2.2),
                                      width: MediaQueryHelper.sizeFromWidth(
                                          context, 1),
                                    ),
                                    Expanded(child: containerShearFavorite()),
                                  ]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        productData.description.toString(),
                                        style: AppTextStyles.w600
                                            .copyWith(fontSize: 18),
                                      ),
                                      ListTile(
                                        trailing: const Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.yellow,
                                        ),
                                        title: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "4",
                                            style: AppTextStyles.w600
                                                .copyWith(fontSize: 18),
                                          ),
                                        ),
                                        leading: Text(
                                          "${productData.price.toString()} ج.م ",
                                          style: AppTextStyles.w600.copyWith(
                                              fontSize: 18,
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      containerCont(
                                        context,
                                        price:
                                            "${double.parse(productData.price) * _cont}",
                                        add: () {
                                          setState(() {
                                            _cont++;
                                          });
                                        },
                                        cont: _cont,
                                        remove: () {
                                          setState(() {
                                            _cont--;
                                          });
                                        },
                                      ),
                                      ButtonTemplate(
                                        width: MediaQueryHelper.sizeFromWidth(
                                            context, 2),
                                        color: AppColors.primaryColor,
                                        colorText: AppColors.white,
                                        text1: 'أضف للسلة',
                                        onPressed: () {
                                          context
                                              .read<HomeCubit>()
                                              .addItemToCart(CartProduct(
                                                  count: _cont,
                                                  image: productData.imageLink
                                                      .toString(),
                                                  title: productData.name
                                                      .toString(),
                                                  price: productData.price
                                                      .toString()));
                                        },
                                        icon: Icons.add_shopping_cart_outlined,
                                      ),
                                      SizedBox(
                                        height: MediaQueryHelper.sizeFromHeight(
                                            context, 20),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
              );
            },
          );
        },
      ),
    );
  }
}
