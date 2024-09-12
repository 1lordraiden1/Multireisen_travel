import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/responses/hotel/hotel_details_response.dart';

class FacilityItem extends StatefulWidget {
  const FacilityItem({
    super.key,
    required this.homeCubit,
    required this.facility,
  });

  final HomeCubit homeCubit;
  final String facility;
  @override
  State<FacilityItem> createState() => _FacilityItemState();
}

class _FacilityItemState extends State<FacilityItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
      decoration: BoxDecoration(
          color: blue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        children: [
          Icon(Icons.circle),
          5.horizontalSpace,
          Text(
            widget.facility,
            style: TextStylesManager.mediumStyle(fontSize: 12.sp, color: red),
          ),
        ],
      ),
    );
  }
}
