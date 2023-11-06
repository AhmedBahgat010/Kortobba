
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_lazy_indexed_stack/src/flutter_lazy_indexed_stack.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Features/Cart/view/view.dart';
import 'package:kortobaa_task/Features/Categories/view/view.dart';
import 'package:kortobaa_task/Features/Favorite/view/view.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/view.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../manger/tabs_cubit.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/main';

  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _bottomNavIndex = 0; //default index of a first screen

  final iconList = <IconData>[
    Icons.home,
    Icons.scatter_plot,
    Icons.favorite_rounded,
    Icons.person,
  ];
  final iconListText = <String>[
    "الرائسية",
    "الاقسام",
    "المفضلة",
    "الحساب",

  ];


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabsCubit()),
      ],
      child: Scaffold(
        body: LazyIndexedStack(
          index:_bottomNavIndex,
          children:  [
            HomeScreen(),
            CategoriesScreen(),
            FavoriteScreen(),
            CartScreen(),


          ],
        ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColorOrange,
            shape: new CircleBorder(),

            child: Icon(
              Icons.shopping_cart,
              color: AppColors.white,
              size: 30,
            ),
            onPressed: () {

            },
          //param

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(

          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? AppColors.primaryColor : AppColors.mediumGrey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 30,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    iconListText[index],
                    maxLines: 1,
                    style: AppTextStyles.w600.copyWith(color: color,fontSize: 16),

                  ),
                )
              ],
            );
          },
      activeIndex: _bottomNavIndex,
      backgroundColor: AppColors.white,
      splashColor: AppColors.pink,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,

      onTap: (index) => setState(() => _bottomNavIndex = index),

      )),
    );
  }
}
