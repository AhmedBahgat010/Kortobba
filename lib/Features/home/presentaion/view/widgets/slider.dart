import 'package:flutter/material.dart';

import '../../../../../Core/Utils/Assets Manager.dart';
List imageList=[
  AssetsManager.slide1,
  AssetsManager.slide2,
];
final pages = List.generate(
    imageList.length,
      (index,) =>  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Image.asset(
          imageList[index],
          fit: BoxFit.cover,
        ),
      ));

