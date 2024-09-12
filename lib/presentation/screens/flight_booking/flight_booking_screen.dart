import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_view.dart';
import 'package:qfly/presentation/screens/payment/payment_screen.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_amenities_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_details_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/traveller_details_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';

import '../../../config/routes/app_routes.dart';

class FlightBookingScreen extends StatefulWidget {
  const FlightBookingScreen({
    super.key,
    required this.homeCubit,
    required this.itemId,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Entity flight;
  final String itemId;

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  @override
  void initState() {
    super.initState();
    // clear data
    widget.homeCubit.selectFlightResponse.data = null;

    widget.homeCubit.createPassengers(
      widget.homeCubit.adults +
          widget.homeCubit.children +
          widget.homeCubit.infant,
    );

    widget.homeCubit.selectFlight(widget.itemId);

    print(widget.homeCubit.passengers);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Scaffold(
            body: widget.homeCubit.isFlightSelectionLoading
                ? callerWidget // Loading Screen
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomAppBarView(
                          title: 'Enter Passengers Info',
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "${widget.flight.segments![0].carrier!.name!} Airline",
                                ),
                              ),
                              TicketView(
                                isDetailed: widget.flight.segments!.length > 1
                                    ? true
                                    : false,
                                flight: widget.flight,
                                homeCubit: widget.homeCubit,
                              ),
                              10.verticalSpace,
                              FlightDetailsView(
                                homeCubit: widget.homeCubit,
                                flight: widget.flight,
                                details: widget.homeCubit.fareQuote,
                              ),
                              10.verticalSpace,
                              TravellerDetailsView(
                                homeCubit: widget.homeCubit,
                                flight: widget.flight,
                              ),
                              40.verticalSpace,
                              Column(
                                children: [
                                  RoundedBtn(
                                    title: 'Next',
                                    onTap: () {
                                      widget.homeCubit.passengers.any(
                                        (element) => element.isEmpty(),
                                      )
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Please Enter All Passengers Data",
                                                ),
                                              ),
                                            )
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentScreen(
                                                  homeCubit: widget.homeCubit,
                                                  flight: widget.flight,
                                                  itemId: widget.itemId,
                                                ),
                                              ),
                                            );
                                    },
                                  ),
                                ],
                              ),
                              20.verticalSpace
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}

Widget callerWidget = const Center(
  child: CircularProgressIndicator(),
);
