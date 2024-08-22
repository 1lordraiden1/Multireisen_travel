import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/presentation/screens/checkout/save_passengers_screen.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomFooterView extends StatelessWidget {
  const RoomFooterView({
    super.key,
    required this.homeCubit,
    required this.room,
    required this.hotel,
  });

  final HomeCubit homeCubit;
  final Hotel hotel;
  final Room room;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.verticalSpace,
              room.priceInfo!.isNotEmpty
                  ? TextWithIconView(
                      iconPath: ImageAssets.discountIcon,
                      text: '10% Discount ${room.priceInfo}',
                      textStyle: TextStylesManager.mediumStyle(fontSize: 12.sp),
                    )
                  : const SizedBox.shrink(),
              6.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Text(
                  'Applied to the price before taxes and fees',
                  style: TextStylesManager.regularStyle(fontSize: 9.sp),
                ),
              ),
              10.verticalSpace,
              Text(
                'Price in (${Jiffy.parseFromDateTime(homeCubit.checkInDate).MMMd} - ${Jiffy.parseFromDateTime(homeCubit.checkOutDate).MMMd})',
                style: TextStylesManager.mediumStyle(fontSize: 10.sp),
              ),
              4.verticalSpace,
              Row(
                children: [
                  room.priceInfo!.isNotEmpty
                      ? Text(
                          'US\$${room.price!.total}',
                          style: TextStylesManager.semiBoldThroughLineStyle(
                              fontSize: 14.sp, color: red),
                        )
                      : const SizedBox.shrink(),
                  8.horizontalSpace,
                  Text(
                    'US\$${room.priceInfo!.isNotEmpty ? room.priceInfo! : ((room.price!.total!) - (room.price!.fees! + room.price!.tax!)).toStringAsFixed(
                        2,
                      )}',
                    style: TextStylesManager.semiBoldStyle(fontSize: 14.sp),
                  ),
                ],
              ),
              4.verticalSpace,
              Text(
                '+ US\$${room.price!.fees! + room.price!.tax!} taxes and fees',
                style: TextStylesManager.regularStyle(fontSize: 9.sp),
              ),
              16.verticalSpace,
              RoundedBtn(
                title: 'Select and customize',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavePassengersScreen(
                      homeCubit: homeCubit,
                      hotel: hotel,
                      itemId: room.itemId!,
                      solutionId: room.solutionId!,
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
