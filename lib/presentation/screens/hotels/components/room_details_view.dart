import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/presentation/screens/hotel_details/hotel_details_screen.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_with_icon.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/text_styles_manager.dart';

class RoomDetailsView extends StatelessWidget {
  const RoomDetailsView(
      {super.key, required this.homeCubit, required this.hotel});

  final HomeCubit homeCubit;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style:
                  TextStylesManager.regularStyle(fontSize: 9.sp, color: grey),
            ),
            Wrap(
              children: [
                Text(
                  hotel.rooms!.isEmpty
                      ? "No available rooms"
                      : '\$${hotel.rooms!.first.price!.total}',
                  style: TextStylesManager.mediumStyle(
                      fontSize: 12.sp, color: primaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '/pernight',
                      style: TextStylesManager.regularStyle(
                          fontSize: 9.sp, color: grey),
                    ),
                    Text(
                      'Hotel rooms : ${hotel.rooms!.length}',
                      style: TextStylesManager.mediumStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                    5.horizontalSpace
                  ],
                ),
              ],
            )
          ],
        ),
        Flexible(
          child: RoundedBtnWithIcon(
            title: 'Book',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailsScreen(
                  homeCubit: homeCubit,
                  hotel: hotel,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
