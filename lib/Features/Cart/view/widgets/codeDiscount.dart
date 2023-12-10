import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Utils/Assets%20Manager.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';
import '../../../../Core/Utils/Widgets/ButtonTemplate/ButtonTemplate.dart';

Widget codeDiscount(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 18.0),
    child: Stack(
      children: [
        Container(
            width: MediaQueryHelper.sizeFromWidth(context, 1),
            child: Image.asset(AssetsManager.codeDiscount,fit: BoxFit.fill,)),
        Positioned(
          bottom: 5,
          child: Row(
            children: [
              Container(
                height: MediaQueryHelper.sizeFromHeight(context, 13),
                width: MediaQueryHelper.sizeFromWidth(context, 2.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white.withOpacity(.5),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10), // Add padding to create space between the container and TextField
                  child: TextField(
                    style: AppTextStyles.lrTitles.apply(color: AppColors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none, // Remove the horizontal line
                      hintText: "أدخل رقم الكوبون",
                      hintStyle: AppTextStyles.w800.copyWith(color: AppColors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
              ButtonTemplate(
                  width: MediaQueryHelper.sizeFromWidth(context, 3.5),
                  color: AppColors.white,
                  colorText: AppColors.black,
                  minheight: MediaQueryHelper.sizeFromHeight(context, 13),
                  text1: "تطبيق",
                  onPressed: () {})
            ],
          ),
        ),
      ],
    ),
  );
}
