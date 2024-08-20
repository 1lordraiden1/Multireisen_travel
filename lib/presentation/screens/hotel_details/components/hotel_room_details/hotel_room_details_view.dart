import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/bed_options_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_header_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_item_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/room_body_details_view.dart';

class HotelRoomDetailsView extends StatelessWidget {
  const HotelRoomDetailsView({
    super.key,
    required this.homeCubit,
    required this.availableRooms,
  });

  final HomeCubit homeCubit;
  final List<Room> availableRooms;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: availableRooms.length,
      itemBuilder: (BuildContext context, int index) {
        return HotelRoomItemView(
          homeCubit: homeCubit,
          room: availableRooms[index],
        );
      },
    );
  }
}
