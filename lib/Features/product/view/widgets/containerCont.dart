import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';
import '../../../../Core/Utils/Responsive.dart';

Widget containerCont(
  context, {
  required String price,
  required Function()? add,
  required Function()? remove,
  required String cont,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQueryHelper.sizeFromWidth(context, 2.5),
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: AppColors.primaryColor,
                ),
                padding: EdgeInsets.all(12),
                child: InkWell(
                  onTap: add,
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  cont,
                  style: AppTextStyles.boldtitles.copyWith(fontSize: 18),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: AppColors.primaryColor,
                ),
                padding: EdgeInsets.all(12),
                child: InkWell(
                  onTap: remove,
                  child: Icon(
                    Icons.remove,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            width: MediaQueryHelper.sizeFromWidth(context, 2.5),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "$price ج.م",
                textAlign: TextAlign.center,
                style: AppTextStyles.boldtitles.copyWith(fontSize: 18),
              ),
            )),
      ],
    ),
  );
}
