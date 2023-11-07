import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Assets%20Manager.dart';
import 'package:kortobaa_task/Core/Utils/Shared%20Methods.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/manger/home_cubit.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/manger/home_state.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/category_box.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/product_item.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/slider.dart';
import 'package:kortobaa_task/Features/product/view/view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/Core Components.dart';
import '../../../../Core/Utils/Responsive.dart';
import '../../../Categories/view/manger/categories_cubit.dart';
import '../../../Categories/view/manger/categories_state.dart';
import '../data/models/home_response.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  int _index = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesCubit()..getCategories(),
        ),
      ],
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, categoriesState) {
          final categoriesData =
              context.read<CategoriesCubit>().categoriesResponse;
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              print(state);
            },
            builder: (context, state) {
              final homeData = context.read<HomeCubit>().homeResponse;
              final allProducts = context.read<HomeCubit>().allProducts;
              return state is HomeLoading ||
                      categoriesState is CategoriesLoading
                  ? const LoadingWidget(
                      color: AppColors.primaryColor,
                    )
                  : SingleChildScrollView(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width:
                                    MediaQueryHelper.sizeFromWidth(context, 1),
                                height: MediaQueryHelper.sizeFromHeight(
                                    context, 3.5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage(imageList[_index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 20.0, sigmaY: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQueryHelper.sizeFromHeight(context, 4),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: SizedBox(
                                  height: MediaQueryHelper.sizeFromHeight(
                                      context, 7),
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoriesData!.results!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                              categoriesData
                                                  .results![index].imageLink
                                                  .toString(),
                                            ),
                                          ),
                                          Text(
                                              categoriesData
                                                  .results![index].name
                                                  .toString(),
                                              style: AppTextStyles.boldtitles
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color:
                                                          AppColors.mediumGrey))
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, x) {
                                      return SizedBox(
                                        width: MediaQueryHelper.sizeFromWidth(
                                            context, 30),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 200,
                                                    child: Text(
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        'وصل حديث',
                                                        style: AppTextStyles
                                                            .boldtitles
                                                            .copyWith(
                                                          fontSize: 18,
                                                        )),
                                                  ),
                                                  Text('عرض الكل',
                                                      style: AppTextStyles
                                                          .boldtitles
                                                          .copyWith(
                                                              fontSize: 16,
                                                              color: AppColors
                                                                  .mediumGrey)),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              height: MediaQueryHelper
                                                  .sizeFromHeight(context, 3.1),
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    for (var result
                                                        in homeData.results!) {
                                                      allProducts.add(Product(
                                                          id: result.id,
                                                          name: result.name
                                                              .toString(),
                                                          price: result.price
                                                              .toString(),
                                                          image: result
                                                              .imageLink
                                                              .toString()));
                                                    }

                                                    final product = homeData
                                                        .results![index];

                                                    final isFavorite = context
                                                        .read<HomeCubit>()
                                                        .favoriteResults
                                                        .any((p) =>
                                                            p.id ==
                                                            product
                                                                .id); // دة الكود اللى بيرجع ليا bool اعلشان اعرف العنصر دة فى الليست او لا
                                                    return ProductItem(
                                                      model: homeData,
                                                      index: index,
                                                      isFavorite: isFavorite
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      ontapFavorites: () {
                                                        int? resultId = homeData
                                                            .results![index].id;
                                                        context
                                                            .read<HomeCubit>()
                                                            .toggleFavorite(
                                                                resultId!);
                                                        print(homeData
                                                            .results![index]
                                                            .id);
                                                        // دة الكود اللى ب ضيف فية id لtoggleFavorite
                                                      },
                                                      ontapnavigate: () {
                                                        navigateTo(
                                                            context,
                                                            ProductScreen(
                                                              id: homeData
                                                                  .results![
                                                                      index]
                                                                  .id,
                                                            ));
                                                      },
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, x) {
                                                    return SizedBox(
                                                      width: MediaQueryHelper
                                                          .sizeFromWidth(
                                                              context, 30),
                                                    );
                                                  },
                                                  itemCount: homeData!
                                                      .results!.length),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      },
                                      itemCount: 1)
                                ],
                              )
                            ],
                          ),
                          Positioned(
                            top: MediaQueryHelper.sizeFromHeight(context, 20),
                            left: 20,
                            right: 20,
                            // right: MediaQueryHelper.sizeFromWidth(context, 9),
                            child: Column(
                              children: [
                                Center(
                                  child: ListTile(
                                      leading: Icon(Icons.menu),
                                      title: Center(
                                          child: Text(
                                        "الرئيسية",
                                        style: AppTextStyles.lrTitles,
                                      ))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5, top: 10, bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.white.withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    // Use a Material design search bar
                                    child: TextField(
                                      controller: _searchController,
                                      decoration: InputDecoration(
                                        hintText: 'عم تبحث ؟',
                                        border: InputBorder.none,
                                        // Remove the horizontal line
                                        hintStyle: AppTextStyles.w600.copyWith(
                                            color: AppColors.black,
                                            fontSize: 16),

                                        // Add a search icon or button to the search bar
                                        prefixIcon: IconButton(
                                          icon: Icon(Icons.search),
                                          onPressed: () {
                                            // Perform the search here
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQueryHelper.sizeFromWidth(
                                      context, 1),
                                  height: MediaQueryHelper.sizeFromHeight(
                                      context, 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: PageView.builder(
                                    itemCount: imageList.length,
                                    controller: controller,
                                    onPageChanged: (value) {
                                      setState(() {
                                        _index = value;
                                      });
                                    },
                                    itemBuilder: (_, index) {
                                      return pages[index];
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                SmoothPageIndicator(
                                    controller: controller,
                                    count: pages.length,
                                    effect: const WormEffect(
                                        radius: 20,
                                        dotHeight: 5,
                                        dotWidth: 20,
                                        activeDotColor: AppColors.primaryColor,
                                        dotColor: AppColors.mediumGrey))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}
