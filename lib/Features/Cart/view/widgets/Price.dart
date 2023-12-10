import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';

class Price extends StatelessWidget {
  const Price({Key? key, required this.allPrice, required this.priceRate})
      : super(key: key);
  final String allPrice;
  final String priceRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الإجمالي",
                  style: AppTextStyles.boldTitles
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(
                  "$allPrice ج.م ",
                  style: AppTextStyles.lrTitles,
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الضرائب",
                  style: AppTextStyles.boldTitles
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(
                  "$priceRate ج.م ",
                  style: AppTextStyles.lrTitles,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
