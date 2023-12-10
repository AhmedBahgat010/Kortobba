import 'package:flutter/material.dart';
import 'package:kortobaa_task/Features/home/presentaion/view/widgets/slider.dart';

import '../../../../../../Core/Utils/App Textstyle.dart';

class TopBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            "الرئيسية",
            style: AppTextStyles.lrTitles,
          ),
        ),
      ),
    );
  }
}



