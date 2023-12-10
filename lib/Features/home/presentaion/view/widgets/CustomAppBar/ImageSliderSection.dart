
import 'package:flutter/cupertino.dart';

import '../../../../../../Core/Utils/Responsive.dart';

class ImageSliderSection extends StatefulWidget {
  final List<Widget> pages;
  final List<String> imageList;


  ImageSliderSection({required this.pages, required this.imageList,});

  @override
  _ImageSliderSectionState createState() => _ImageSliderSectionState();
}

class _ImageSliderSectionState extends State<ImageSliderSection> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryHelper.sizeFromWidth(context, 1),
      height: MediaQueryHelper.sizeFromHeight(context, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: PageView.builder(
        itemCount: widget.imageList.length,
        controller: controller,
        onPageChanged: (value) {
          setState(() {
              // widget.index = value;
          });
        },
        itemBuilder: (_, index) {
          return widget.pages[index];
        },
      ),
    );
  }
}
