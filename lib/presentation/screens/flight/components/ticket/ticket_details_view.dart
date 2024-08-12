import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/direction_details_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/footer_ticket_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_item_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({
    super.key,
    required this.homeCubit,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Entity flight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TicketItemDetailsView(
                    homeCubit: homeCubit,
                    title: flight.segments![0].origin!.name.toString(),
                    time: flight.segments![0].origin!.time.toString(),
                  ),
                ),
                DirectionDetailsView(
                  flight: flight,
                  homeCubit: homeCubit,
                ),
                TicketItemDetailsView(
                  homeCubit: homeCubit,
                  time: flight
                      .segments![flight.segments!.length - 1].destination!.time
                      .toString(),
                  title: flight
                      .segments![flight.segments!.length - 1].destination!.name
                      .toString(),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          FooterTicketView(
            homeCubit: homeCubit,
            totalPrice: '\$${flight.price!.total!.toStringAsFixed(2)}',
            seats:
                flight.segments![0].operatingCarrier!.flightNumber.toString(),
            numOfBags: flight.baggageAllowance!.isEmpty
                ? "No Baggage Allowed"
                : flight.baggageAllowance![0].toString(),
          ),
        ],
      ),
    );
  }
}


/* flight.allData!.segments![0].length > 1
                      ? flight
                          .allData!
                          .segments![0][flight.allData!.segments![0].length - 1]
                          .arrivalTime
                          .toString()
                      : flight.allData!.segments![0][0].arrivalTime.toString(),
                       */
