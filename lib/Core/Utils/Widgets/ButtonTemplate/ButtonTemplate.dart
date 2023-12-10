import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../App Colors.dart';
import '../../App Textstyle.dart';
import '../LoadingWidget/LoadingWidget.dart';

class ButtonTemplate extends StatelessWidget {
  ButtonTemplate({
    Key? key,
    required this.color,
    this.isLoading = false,
    this.colorText = AppColors.primaryColor,
    required this.text1,
    required this.onPressed,
    this.icon,
    this.width = 318,
    this.minheight = 60,
    this.fontSize = 18,
  }) : super(key: key);
  Color color;
  Color colorText;
  String text1;
  final bool isLoading;
  double width;
  double minheight;
  double fontSize;
  IconData? icon;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: minheight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null
                  ? SizedBox()
                  : Center(
                child: Icon(icon, size: 21, color: AppColors.white),
              ),
              SizedBox(
                width: 5,
              ),
              isLoading
                  ? const LoadingWidget(
                type: LoadingType.threeBounce,
                color: AppColors.white,
                size: 18,
              )
                  : Center(
                child: Text(text1,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.w800
                        .copyWith(color: colorText, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
