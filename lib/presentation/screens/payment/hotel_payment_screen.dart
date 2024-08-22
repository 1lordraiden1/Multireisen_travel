import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/presentation/screens/login/login_screen.dart';
import 'package:qfly/presentation/screens/payment/components/card_payment_view.dart';
import 'package:qfly/presentation/screens/payment/components/payment_ways_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_with_value_view.dart';
import 'package:readmore/readmore.dart';

class HotelPaymentScreen extends StatefulWidget {
  const HotelPaymentScreen({
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
  State<HotelPaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<HotelPaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Clear Data
    widget.homeCubit.hotelPassengersResponse.data = null;
    widget.homeCubit.finalizeHotelBookingResponse.data = null;

    // Get Data
    widget.homeCubit.saveHotelPassengers(
      widget.itemId,
      widget.solutionId,
    );

    try {} catch (e) {
      callerWidget = Center(
        child: Text(
          "Sorry There's A server error, Please try to search again or contact tech support",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {
          if (state is FinalizingHotelBookingState &&
              widget.homeCubit.isSavePassengersLoading == false) {
            callerWidget = showPaymentWidget(context, widget.homeCubit);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: state is GettingAlreadyBookedTicketState // temp
                ? null
                : () async {
                    return false;
                  },
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBarView(
                    title: 'Payment',
                    canPop: false,
                  ),
                  widget.homeCubit.isBookingFinalizationLoading &&
                          widget.homeCubit.isSavePassengersLoading
                      ? const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              Text('Checking everything is ok')
                            ],
                          ),
                        )
                      : callerWidget
                ],
              ),
            ),
          );
        });
  }
}

Widget callerWidget = Center(
  child: CircularProgressIndicator(),
);

Widget showPaymentWidget(BuildContext context, HomeCubit homeCubit) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ticket Details',
            style: TextStylesManager.semiBoldStyle(),
          ),
          5.verticalSpace,
          TextWithValueView(
            text: 'Booking ID',
            value: homeCubit.finalizeHotelBookingResponse.data!.bookingId!
                .toString(),
          ),
          5.verticalSpace,
          TextWithValueView(
            text: 'Is Refundable',
            value: homeCubit.finalizeHotelBookingResponse.data!.refundable!
                .toString(),
          ),
          5.verticalSpace,
          TextWithValueView(
            text: 'Booking Number',
            value: ReadMoreText(
              // some work here to trim the read more text
              trimMode: TrimMode.Line,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',

              trimLines: 1,
              //isExpandable: true,
              homeCubit.finalizeHotelBookingResponse.data!.bookings![0]
                  .bookingNumber!
                  .toString(),
            ).data,
          ),
          8.verticalSpace,
          PaymentWaysView(),
          20.verticalSpace,
          CardPaymentView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: RoundedBtn(
              title: 'Get Voucher',
              onTap: () {
                showDialogPopup(context, homeCubit);
              },
            ),
          ),
          47.verticalSpace
        ],
      ),
    ),
  );
}

void showDialogPopup(BuildContext context, HomeCubit homeCubit) async {
  await homeCubit.issueTicket(
    homeCubit.finalizeHotelBookingResponse.data!.bookingId.toString(),
    homeCubit.finalizeHotelBookingResponse.data!.bookings![0].bookingItemId!
        .toString(),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocConsumer<HomeCubit, HomeState>(
        bloc: homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return homeCubit.isGettingTicketLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 16,
                  child: Container(
                    height: 400,
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ticket",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: homeCubit.isIssuingTicketLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Column(
                                  children: [
                                    Text(
                                      homeCubit.issueTicketResponse.data!
                                              .success!
                                          ? "Success"
                                          : "Failed",
                                    ), // Get Ticket
                                    Text(
                                      homeCubit.issueTicketResponse.data!
                                              .success!
                                          ? "Now your ticket is stored in your trips and you can back login below and ticket much trips as you can"
                                          : "There is might ",
                                    ),
                                  ],
                                ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (Route<dynamic> route) => false,
                            ); // Close the dialog
                          },
                          child: const Text("Go Back Login"),
                        ),
                      ],
                    ),
                  ),
                );
        },
      );
    },
  );
}