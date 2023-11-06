// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
// import 'package:kortobaa_task/Core/Utils/Core%20Components.dart';
// import 'package:kortobaa_task/Core/Utils/Responsive.dart';
// import 'package:kortobaa_task/Features/Favorite/view/widgets/containerFavorite.dart';
//
// import '../../../Core/Utils/App Textstyle.dart';
// import '../../home/presentaion/view/manger/home_cubit.dart';
// import '../../home/presentaion/view/manger/home_state.dart';
//
// class FavoriteScreen extends StatefulWidget {
//   FavoriteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }
//
// class _FavoriteScreenState extends State<FavoriteScreen> {
//   final controller = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..getHome(),
//       child: BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           final homeData = context.read<HomeCubit>().homeResponse;
//           final favoriteResults = context.read<HomeCubit>().favoriteResults;
//
//           return Scaffold(
//               appBar: AppBar(
//                 title: Text("المفضلة"),
//                 leading: IconButton(
//                   icon: Icon(Icons.menu),
//                   onPressed: () {},
//                 ),
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.search,
//                     ),
//                   )
//                 ],
//               ),
//               body: state is HomeLoading
//                   ? const LoadingWidget(
//                       color: AppColors.primaryColor,
//                     )
//                   : favoriteResults.length == 0
//                       ? SizedBox()
//                       : RefreshIndicator(
//                 onRefresh: () async => context
//                     .read<HomeCubit>()
//                     .getHome(),
//                         child: ListView.builder(
//                             itemCount: 2,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 10),
//                             itemBuilder: (context, index) {
//                               print(favoriteResults.length);
//                               return containerFavorite(
//                                 context,
//                                 title: favoriteResults[index].name,
//                                 imageUrl:
//                                     "https://kshop.kortobaa.net/storage/product/127/qhQm6jLjtF7k89rUBsRGO9AsKfRCvvg0hZ16B6k0.png",
//                                 price: "123",
//                                 ontapIcon: () {},
//                               );
//                             },
//                           ),
//                       ));
//         },
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Core/Utils/App%20Colors.dart';
import 'package:kortobaa_task/Core/Utils/Core%20Components.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Features/Favorite/view/widgets/containerFavorite.dart';

import '../../../Core/Utils/App Textstyle.dart';
import '../../home/presentaion/view/manger/home_cubit.dart';
import '../../home/presentaion/view/manger/home_state.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
          print(state);
        },
        builder: (context, state) {
          final favoriteResults = context
              .read<HomeCubit>()
              .favoriteResults;
          if (state is FavoriteResultsUpdated)
            print("${state.response.length} ffffffsssssssssssssfff");

          return Scaffold(
              appBar: AppBar(
                title: Text("المفضلة"),
                leading: IconButton(
                  icon: Icon(Icons.menu),
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
              body: state is HomeLoading
                  ? const LoadingWidget(
                color: AppColors.primaryColor,
              )
                  : favoriteResults.length == 0
                  ? SizedBox()
                  : RefreshIndicator(
                onRefresh: () async =>
                    context
                        .read<HomeCubit>()
                        .getHome(),
                child: ListView.builder(
                  itemCount: 2,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  itemBuilder: (context, index) {
                    print(favoriteResults.length);
                    return containerFavorite(
                      context,
                      title: favoriteResults[index].name,
                      imageUrl:
                      "https://kshop.kortobaa.net/storage/product/127/qhQm6jLjtF7k89rUBsRGO9AsKfRCvvg0hZ16B6k0.png",
                      price: "123",
                      ontapIcon: () {},
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
