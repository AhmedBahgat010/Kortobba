import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';

import '../../../../Core/Utils/App Colors.dart';

class ContinerCategories extends StatelessWidget {
  ContinerCategories({required this.name, required this.imgpath, Key? key})
      : super(key: key);

  // Data? model;
  String name;
  String imgpath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: MediaQueryHelper.sizeFromHeight(context, 5),
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.8, // تعيين شفافية الصورة هنا


              child:        Container(
                width:
                MediaQueryHelper.sizeFromWidth(context, 1),
                height: MediaQueryHelper.sizeFromHeight(
                    context, 3.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        imgpath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1)),
                ),
              ),


            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                name,
                style: AppTextStyles.lrTitles.copyWith(
                    color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
