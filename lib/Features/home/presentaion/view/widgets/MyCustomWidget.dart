import 'package:flutter/cupertino.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';
import 'package:kortobaa_task/Features/home/presentaion/data/models/home_response.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/ImageSection.dart';

import 'CategoriesSection.dart';
import 'ProductsSection.dart';

class MyCustomWidget extends StatelessWidget {
  final List<String> imageList;
  final int index;
  final dynamic categoriesData;
  final HomeResponse? homeData;
  final  List<Product> allProducts;

  MyCustomWidget({
    required this.imageList,
    required this.index,
    required this.categoriesData,
    required this.homeData, required this.allProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageSection(imageList: imageList, index: index),
        SizedBox(height: MediaQueryHelper.sizeFromHeight(context, 4)),
        CategoriesSection(categoriesData: categoriesData),
        ProductsSection(homeData: homeData, allProducts: allProducts, ),
      ],
    );
  }
}