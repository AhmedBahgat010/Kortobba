import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Core%20Components.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Features/product/view/widgets/containerCont.dart';
import 'package:kortobaa_task/Features/product/view/widgets/containerShear&favorit.dart';

import '../data/models/Product_response.dart';
import 'manger/Product_cubit.dart';
import 'manger/Product_state.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key, required this.id}) : super(key: key);
  final int? id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProduct(widget.id),
      child: BlocConsumer<ProductCubit, ProductState>(
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
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQueryHelper.sizeFromHeight(context, 1.8),
                          width: MediaQueryHelper.sizeFromWidth(context, 1),
                          decoration:
                              BoxDecoration(color: AppColors.white, boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(.05),
                                blurRadius: 4,
                                offset: Offset(4, 8),
                                spreadRadius: 5)
                          ]),
                          child: Column(children: [
                            CachedNetworkImage(
                              imageUrl: productData!.imageLink.toString(),
                              fit: BoxFit.cover,
                              height:
                                  MediaQueryHelper.sizeFromHeight(context, 2.2),
                              width: MediaQueryHelper.sizeFromWidth(context, 1),
                            ),
                            Expanded(child: containerShearFavorite()),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Text(
                                productData.description.toString(),
                                style:
                                    AppTextStyles.w600.copyWith(fontSize: 18),
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
                                price: "10",
                                add: () {},
                                cont: "1",
                                remove: () {},
                              ),
                              ButtonTemplate(
                                width:
                                    MediaQueryHelper.sizeFromWidth(context, 2),
                                color: AppColors.primaryColor,
                                colorText: AppColors.white,
                                text1: 'أضف للسلة',
                                onPressed: () {},
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
      ),
    );
  }
}
