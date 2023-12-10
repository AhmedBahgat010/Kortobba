import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';

class SearchBarSection extends StatelessWidget {
  final TextEditingController searchController;

  SearchBarSection({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 5,
        top: 10,
        bottom: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'عم تبحث ؟',
            border: InputBorder.none,
            hintStyle: AppTextStyles.w600.copyWith(
              color: AppColors.black,
              fontSize: 16,
            ),
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Perform the search here
              },
            ),
          ),
        ),
      ),
    );
  }
}
