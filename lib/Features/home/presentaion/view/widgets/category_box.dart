import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';


class CategoryBox extends StatelessWidget {
  CategoryBox({required this.color, required this.imgPath,required this.txt, Key? key})
      : super(key: key);
  Color color;
  String imgPath;
  String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQueryHelper.sizeFromWidth(context, 6),
          width: MediaQueryHelper.sizeFromWidth(context, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Center(
            child: Image.asset(
              imgPath,
              width: MediaQueryHelper.sizeFromWidth(context, 14),
            ),
          ),
        ),
        Text(txt,style: AppTextStyles.boldtitles.apply(fontSizeDelta: -6),)
      ],
    );
  }
}
