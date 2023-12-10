
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Features/Favorite/view/widgets/containerFavorite.dart';
import '../../../Core/Utils/App Textstyle.dart';
import '../../home/presentaion/view/manger/home_cubit.dart';
import '../../home/presentaion/view/manger/home_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        print(state);
      },
      builder: (context, state) {
        final favoriteResults = context.watch<HomeCubit>().favoriteResults;

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
          body: favoriteResults.isEmpty
              ?  Center(
            child: Text(
              "لا يوجد منتجات فى المفضلة",
              style: AppTextStyles.lrTitles,
            ),
          )
              : ListView.builder(
            itemCount: favoriteResults.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemBuilder: (context, index) {
              return containerFavorite(
                      context,
                      title: favoriteResults[index].name,
                      imageUrl: favoriteResults[index].image.toString(),
                      price: favoriteResults[index].price.toString(),
                      ontapIcon: () {
                        int? resultId = favoriteResults[index].id;
                        context.read<HomeCubit>().toggleFavorite(resultId!);
                      },
                    );
            },
          ),
        );
      },
    );
  }
}
