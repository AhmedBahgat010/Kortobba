import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Utils/Responsive.dart';

import '../../../../Core/Utils/App Colors.dart';
import '../../../../Core/Utils/App Textstyle.dart';

class ContinerMyCart extends StatefulWidget {
  const ContinerMyCart(
    context, {
    required this.image,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.title,
    this.add,
    this.remove,
    this.removeitem,
  });

  final String image;
  final int quantity;
  final String price;
  final String totalPrice;
  final Function()? add;
  final Function()? remove;
  final Function()? removeitem;
  final String title;

  @override
  State<ContinerMyCart> createState() => _ContinerMyCartState();
}

class _ContinerMyCartState extends State<ContinerMyCart> {
  @override
  int itemCount = 1;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQueryHelper.sizeFromWidth(context, 2.7),
                height: MediaQueryHelper.sizeFromHeight(context, 6),
                child: CachedNetworkImage(
                  imageUrl:
                  widget.image,
                  fit: BoxFit.cover,

                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      widget.title,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.lrTitles.copyWith(
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.price,
                            style: AppTextStyles.w800.copyWith(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' ج.م ',
                            style: AppTextStyles.lrTitles.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.lightGreen,
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.all(12),
                    child: InkWell(
                      onTap: widget.add,
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
                      "${widget.quantity}",
                      style: AppTextStyles.boldTitles.copyWith(fontSize: 18),
                    ),
                  ),
                  Container(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.all(12),
                    child: InkWell(
                      onTap: widget.remove,
                      child: Icon(
                        Icons.remove,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.totalPrice,
                      style: AppTextStyles.w800.copyWith(fontSize: 20),
                    ),
                    TextSpan(
                      text: ' ج.م ',
                      style: AppTextStyles.lrTitles.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors.primaryColorOrange,
                padding: EdgeInsets.all(12),
                child: InkWell(
                  onTap: widget.removeitem,
                  child: Icon(
                    Icons.delete_forever,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
