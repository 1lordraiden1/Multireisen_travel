import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/direction_details_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/footer_ticket_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/new_directional_details.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_item_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/utils/common.dart';

class DetailedTicketView extends StatelessWidget {
  const DetailedTicketView({
    super.key,
    required this.homeCubit,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Entity flight;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: flight.segments!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              flight.segments![index].origin!.name.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              flight.segments![index].origin!.time.toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      NewDirectionDetailsView(
                        index: index,
                        flight: flight,
                        homeCubit: homeCubit,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              flight.segments![index].destination!.name
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              flight.segments![index].destination!.time
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                FooterTicketView(
                  homeCubit: homeCubit,
                  totalPrice: index != flight.segments!.length - 1
                      ? 'Waiting Time : ${Utility.parseDuration(
                                flight.segments![index + 1].origin!.time!,
                              ) - Utility.parseDuration(
                                flight.segments![index].destination!.time!,
                              )}'
                          .toString()
                          .substring(0, 22)
                      : "no waiting", // temp for now
                  seats:
                      flight.segments![index].carrier!.flightNumber.toString(),
                  numOfBags: flight.segments![index].equipment.toString(),
                ),
              ],
            ),
          );
        });
  }
}
