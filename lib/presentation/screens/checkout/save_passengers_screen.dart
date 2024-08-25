import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/data/model/passenger_model.dart';
import 'package:qfly/data/model/room/request_room_model.dart';
import 'package:qfly/presentation/screens/checkout/hotel_passengers_widget.dart';
import 'package:qfly/presentation/screens/payment/hotel_payment_screen.dart';
import 'package:qfly/presentation/screens/review_flight/components/traveller_details_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

class SavePassengersScreen extends StatefulWidget {
  const SavePassengersScreen({
    super.key,
    required this.homeCubit,
    required this.hotel,
    required this.itemId,
    required this.solutionId,
  });

  final HomeCubit homeCubit;
  final Hotel hotel;
  final String itemId;
  final int solutionId;

  @override
  State<SavePassengersScreen> createState() => _SavePassengersScreenState();
}

class _SavePassengersScreenState extends State<SavePassengersScreen> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    widget.homeCubit.passengers.clear();

    widget.homeCubit.createPassengers(
      RoomItem.calculateAdultsInRooms(
            widget.homeCubit.requestRooms,
          ) +
          RoomItem.calculateChildrenInRooms(
            widget.homeCubit.requestRooms,
          ),
    );

    await widget.homeCubit.selectHotelAndRoom(
      widget.itemId,
      widget.solutionId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Scaffold(
            body: widget.homeCubit.isHotelAndRoomSelectionLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomAppBarView(
                          title: 'Passengers',
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HotelPassengersWidget(
                            homeCubit: widget.homeCubit,
                            hotel: widget.hotel,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: RoundedBtn(
                            title: "Book",
                            onTap: () {
                              widget.homeCubit.checKPassengerData()
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please Enter All Passengers' Data"),
                                      ),
                                    )
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HotelPaymentScreen(
                                          homeCubit: widget.homeCubit,
                                          hotel: widget.hotel,
                                          itemId: widget.itemId,
                                          solutionId: widget.solutionId,
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}
