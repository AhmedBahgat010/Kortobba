import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';

Widget containerShearFavorite() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_rounded,
                color: AppColors.primaryColorOrange,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "مضاف للمفضلة",
                style: AppTextStyles.bold.copyWith(
                    color: AppColors.primaryColorOrange, fontSize: 16),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 3,
            height: 40,
            color: AppColors.mediumGrey,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.share,
                color: AppColors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "مشاركة المنتج",
                style: AppTextStyles.lrTitles.copyWith(fontSize: 16),
              ),

            ],
          ),
        ],
      ),
    ),
  );
}
