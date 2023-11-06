import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';

Widget listTile(){
  return            ListTile(
      contentPadding:
      EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      tileColor: AppColors.white,
      trailing: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "الإجمالي",
              style: AppTextStyles.w800.copyWith(
                  fontSize: 20, color: AppColors.primaryColor),
            ),
            TextSpan(
                text: '  70,048 ج.م ',
                style: AppTextStyles.w600.copyWith(fontSize: 18)),
          ],
        ),
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "(352)",
              style: AppTextStyles.w800.copyWith(
                  fontSize: 20, color: AppColors.primaryColor),
            ),
            TextSpan(
                text: '  عنصر ',
                style: AppTextStyles.w600.copyWith(fontSize: 18)),
          ],
        ),
      ));
}