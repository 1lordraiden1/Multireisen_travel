import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/presentation/screens/checkout/checkout_screen.dart';
import 'package:qfly/presentation/screens/checkout/save_passengers_screen.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_desc_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_facilities_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_policies_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_with_icon.dart';
import 'package:qfly/presentation/widgets/container_border_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({
    super.key,
    required this.homeCubit,
    required this.hotel,
  });

  final HomeCubit homeCubit;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      children: [
        30.verticalSpace,
        ContainerBorderView(
          homeCubit: homeCubit,
          hotel: hotel,
        ),
        16.verticalSpace,
        HotelFacilitiesView(
          homeCubit: homeCubit,
          facility: homeCubit
              .hotelDetailsResponse.data!.properties!.facilities!.first,
        ),
        HotelDescView(
          homeCubit: homeCubit,
          des: homeCubit.hotelDetailsResponse.data!.properties!.description!,
        ),
        /*  HotelPoliciesView(), */
        30.verticalSpace,
      ],
    );
  }
}
