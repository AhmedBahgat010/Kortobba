import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/App Textstyle.dart';
import '../../../../../Core/Utils/Responsive.dart';

class CategoriesSection extends StatelessWidget {
  final dynamic categoriesData;

  CategoriesSection({required this.categoriesData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQueryHelper.sizeFromHeight(context, 7),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesData!.results!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    categoriesData.results![index].imageLink.toString(),
                  ),
                ),
                Text(
                  categoriesData.results![index].name.toString(),
                  style: AppTextStyles.boldTitles.copyWith(
                    fontSize: 16,
                    color: AppColors.mediumGrey,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, x) {
            return SizedBox(
              width: MediaQueryHelper.sizeFromWidth(context, 30),
            );
          },
        ),
      ),
    );
  }
}
