import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/config/routes/app_routes.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/presentation/screens/hotel_details/hotel_details_screen.dart';
import 'package:qfly/utils/media_query_values.dart';
import '../../../widgets/shimmer/fancy_image_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelImageView extends StatelessWidget {
  const HotelImageView({
    super.key,
    required this.homeCubit,
    required this.image,
  });

  final HomeCubit homeCubit;

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailsScreen(),
                  ),
                ),
            child: FancyImageShape(
              radius: BorderRadius.vertical(top: Radius.circular(20.r)),
              imagePath: image ??
                  'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp',
              width: context.width,
              height: 220.h,
            )),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(ImageAssets.saveIcon),
        ),
      ],
    );
  }
}
