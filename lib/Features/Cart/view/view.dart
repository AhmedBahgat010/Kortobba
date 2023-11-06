import 'package:flutter/material.dart';
import 'package:kortobaa_task/Core/Utils/Core%20Components.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/ContinerMyCart.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/ListTileAll.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/Price.dart';
import 'package:kortobaa_task/Features/Cart/view/widgets/codeDiscount.dart';

import '../../../Core/Utils/App Colors.dart';
import '../../../Core/Utils/App Textstyle.dart';
import '../../../Core/Utils/Responsive.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سلة التسوق'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              listTile(),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ContinerMyCart(
                    context,
                    removeitem: () {},
                    add: () {},
                    remove: () {},
                    image:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ_actFCiDAY6SC1b8KZBrhJTg2LHKfbZ9Z4eAVYsiWQBKNNbPp9kdpl1LlO8Fo7BoZEU&usqp=CAU",
                    title: "عطر برائحة القرنفل والسدر الجبلي مناسب للسهرات والهدايا مغلف في زجاجة مرصعة بالذهب",
                    price: "50",
                    quantity: 5,
                  );
                },
              ),
              codeDiscount(context),
              const Price(
                allPrice: "50",
                priceRate: "68",
              ), SizedBox(
                height: 15,
              ),
              ButtonTemplate(
                  colorText: AppColors.white,
                  width: MediaQueryHelper.sizeFromWidth(context, 1),
                  color: AppColors.primaryColor,
                  text1: "إتمام الشراء",
                  onPressed: () {}),

            ],
          ),
        ),
      ),
    );
  }
}
