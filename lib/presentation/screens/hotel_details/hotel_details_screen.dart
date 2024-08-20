import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_body_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_gallery_view.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({
    super.key,
    required this.homeCubit,
    required this.hotel,
  });

  final HomeCubit homeCubit;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: HotelGalleryView(
                  homeCubit: homeCubit,
                  images: hotel.properties!.images!,
                ),
              ),
              SizedBox(
                height: 600,
                child: HotelBodyView(
                  homeCubit: homeCubit,
                  hotel: hotel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
