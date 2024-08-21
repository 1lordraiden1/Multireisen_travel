import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/utils/common.dart';

class HotelDescView extends StatelessWidget {
  const HotelDescView({
    super.key,
    required this.homeCubit,
    required this.des,
  });

  final HomeCubit homeCubit;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Hotel',
            style: TextStylesManager.mediumStyle(fontSize: 14.sp)),
        5.verticalSpace,
        Text(
          Utility.parseHtmlString(des),
          style: TextStylesManager.regularStyle(fontSize: 12.sp, color: grey),
        ),
      ],
    );
  }
}
