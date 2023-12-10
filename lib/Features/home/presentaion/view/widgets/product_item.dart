import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/Responsive.dart';
import '../../data/models/home_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductItem extends StatefulWidget {
  ProductItem({
  required this.model,
  required this.index,
  required this.ontapFavorites,
  required this.ontapAddCart,
  required this.isFavorite,
  required this.ontapnavigate,
  Key? key,
  }) : super(key: key);
  HomeResponse? model;
  IconData isFavorite;
 final Function()? ontapFavorites;
 final Function()? ontapAddCart;
 final Function()? ontapnavigate;

  int index;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {


  @override
  Widget build(BuildContext context) {

    return FittedBox(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, right: 2, left: 2),
        padding: const EdgeInsets.all(7),
        width: MediaQueryHelper.sizeFromWidth(context, 2.6),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),
        child: InkWell(
          onTap:widget.ontapnavigate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap:widget.ontapFavorites,
                child: Icon(widget.isFavorite)

              ),
              SizedBox(
                height: MediaQueryHelper.sizeFromHeight(context, 8),
                child: Center(
                  child: CachedNetworkImage(
                  imageUrl: widget.model!.results![widget.index].imageLink!,
                  fit: BoxFit.contain,
              ),
                ),
              ),
              SizedBox(
                height: 45,
                child: Text(
                    widget.model!.results![widget.index].description.toString(),
                    maxLines: 2,
                    style: AppTextStyles.w800.copyWith(
                        fontSize: 12,
                        color: AppColors.mediumGrey,
                        overflow: TextOverflow.ellipsis)),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:  widget.model!.results![widget.index].price.toString(),
                            style: AppTextStyles.w800.copyWith(
                              fontSize: 18,
                              color: AppColors.primaryColor
                            ),
                          ),
                          TextSpan(
                              text: 'ج.م',
                              style: AppTextStyles.w600.copyWith(
                                  color: AppColors.primaryColor
,                                  fontSize: 16)),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed:  widget.ontapAddCart,

                        icon: const Icon(Icons.add_shopping_cart_sharp),
                        iconSize: 25,
                        color: AppColors.mediumGrey),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
