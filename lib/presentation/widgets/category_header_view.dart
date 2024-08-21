import 'package:flutter/material.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryHeaderView extends StatelessWidget {
  const CategoryHeaderView({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStylesManager.semiBoldStyle(fontSize: 20.sp),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See All',
            style: TextStylesManager.regularStyle(
              fontSize: 15.sp,
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
