import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';
import '../../../../Core/Utils/Responsive.dart';

Widget containerFavorite(
  context, {
  required String title,
  required String imageUrl,
  required String price,
  required Function()? ontapIcon,

}) {
  return Container(
    color: AppColors.white,
    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        children: [
          CachedNetworkImage(
            height: MediaQueryHelper.sizeFromHeight(context, 2),
            width: MediaQueryHelper.sizeFromWidth(context, 1),
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
                onTap: ontapIcon,
                child: Icon(
                  Icons.favorite_outlined,
                  size: 30,
                )
                //     : Icon(
                //   Icons.favorite_border,
                //   color: AppColors.mediumGrey,
                // ),
                ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          maxLines: 3,
          style: AppTextStyles.w600
              .copyWith(fontSize: 18, overflow: TextOverflow.ellipsis),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: Text(
          "$price  ج.م ",
          style: AppTextStyles.w600.copyWith(
              fontSize: 20,
              color: AppColors.primaryColor,
              overflow: TextOverflow.ellipsis),
        ),
      ),
      Container(
        height: MediaQueryHelper.sizeFromHeight(context, 13),
        width: MediaQueryHelper.sizeFromWidth(context, 1),
        color: AppColors.primaryColor,
        child: Center(
          child: Text(
            "نقل إلى سلة التسوق",
            style: AppTextStyles.boldtitles.copyWith(color: AppColors.white),
          ),
        ),
      )
    ]),
  );
}
