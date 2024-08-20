import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_details_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_review/hotel_reviews_view.dart';
import 'package:qfly/presentation/screens/hotel_details/components/hotel_room_details/hotel_room_details_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_icon_view.dart';

class HotelTabbarView extends StatefulWidget {
  const HotelTabbarView({
    super.key,
    required this.homeCubit,
    required this.hotel,
  });

  final HomeCubit homeCubit;
  final Hotel hotel;

  @override
  State<HotelTabbarView> createState() => _HotelTabbarViewState();
}

class _HotelTabbarViewState extends State<HotelTabbarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();

    

    widget.homeCubit.filterAvailableRooms(widget.hotel.itemId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: false,
                unselectedLabelColor: grey,
                labelColor: primaryColor,
                dragStartBehavior: DragStartBehavior.start,

                tabs: const [
                  FittedBox(
                    child: Tab(
                      child: TextWithIconView(
                        iconPath: ImageAssets.detailsIcon,
                        text: 'Details',
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Tab(
                      child: TextWithIconView(
                        iconPath: ImageAssets.roomIcon,
                        text: 'Rooms',
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Tab(
                      child: TextWithIconView(
                        iconPath: ImageAssets.reviewIcon,
                        text: 'Reviews',
                      ),
                    ),
                  ),
                ],
                controller: _tabController,
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),

                //indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HotelDetailsView(),
                    widget.homeCubit.isAvailableRoomsLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : HotelRoomDetailsView(
                            homeCubit: widget.homeCubit,
                            availableRooms: widget.homeCubit.availableRooms,
                          ),
                    HotelReviewsView(),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
