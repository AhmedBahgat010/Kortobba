import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/Widgets/MessageWidget/MessageWidget.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/manger/home_cubit.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/manger/home_state.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/CustomAppBar/ImageSliderIndicatorSection.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/CustomAppBar/SearchBarSection.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/MyCustomWidget.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/slider.dart';
import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/Responsive.dart';
import '../../../../Core/Utils/Widgets/LoadingWidget/LoadingWidget.dart';
import '../../../../Core/Utils/snackbars.dart';
import '../../../../Core/service_locator/service_locator.dart';
import '../../../Categories/view/manger/categories_cubit.dart';
import '../../../Categories/view/manger/categories_state.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          CategoriesCubit()
            ..getCategories(),
        ),

      ],
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, categoriesState) {
          final categoriesData =
              context
                  .read<CategoriesCubit>()
                  .categoriesResponse;
          return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
               if (state is AddItemCart) {
              ServiceLocator.instance<Snackbars>().success(
              context: context,
              message: state.message,
              );
              }
            },
            builder: (context, state) {
              final homeData = context
                  .read<HomeCubit>()
                  .homeResponse;
              final allProducts = context
                  .read<HomeCubit>()
                  .allProducts;
              return state is HomeLoading ||
                  categoriesState is CategoriesLoading
                  ? const LoadingWidget(
                color: AppColors.primaryColor,
              )
                  : state is HomeError
                  ? MessageWidget(message: state.message.toString())
                  : categoriesState is CategoriesError
                  ? MessageWidget(
                  message: categoriesState.message.toString())
                  : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    MyCustomWidget(imageList: imageList,
                        index: context.watch<HomeCubit>().currentIndex,
                        categoriesData: categoriesData,
                        homeData: homeData,
                        allProducts:allProducts,
                 ),
                    Positioned(
                      top: MediaQueryHelper.sizeFromHeight(
                          context, 20),
                      left: 20,
                      right: 20,
                      // right: MediaQueryHelper.sizeFromWidth(context, 9),
                      child: Column(
                        children: [
                          TopBarSection(),
                          SearchBarSection(searchController: _searchController),

                          Container(
                            width: MediaQueryHelper.sizeFromWidth(
                                context, 1),
                            height:
                            MediaQueryHelper.sizeFromHeight(
                                context, 4),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(15),
                            ),
                            child: PageView.builder(
                              itemCount: imageList.length,
                              controller: controller,
                              onPageChanged: (value) {
                                context.read<HomeCubit>().updateIndex(value);
                              },
                              itemBuilder: (_, index) {
                                return pages[index];
                              },
                            ),
                          ),


                          ImageSliderIndicatorSection(controller: controller, length: pages.length),

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
