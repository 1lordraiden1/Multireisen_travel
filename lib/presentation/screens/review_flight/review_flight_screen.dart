import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_view.dart';
import 'package:qfly/presentation/screens/flight_booking/flight_booking_screen.dart';
import 'package:qfly/presentation/screens/payment/payment_screen.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_amenities_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/flight_details_view.dart';
import 'package:qfly/presentation/screens/review_flight/components/traveller_details_view.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../config/routes/app_routes.dart';

class ReviewFlightScreen extends StatefulWidget {
  const ReviewFlightScreen({
    super.key,
    required this.homeCubit,
    required this.itemId,
    required this.flight,
  });

  final HomeCubit homeCubit;
  final Entity flight;
  final String itemId;

  @override
  State<ReviewFlightScreen> createState() => _ReviewFlightScreenState();
}

class _ReviewFlightScreenState extends State<ReviewFlightScreen> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // clear data
    // widget.homeCubit.details.clear();
    

    widget.homeCubit.createPassengers(
      widget.homeCubit.adults +
          widget.homeCubit.children +
          widget.homeCubit.infant,
    );

    print(widget.homeCubit.passengers);

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.flight.links![0].href!));
  }

  void showWebViewPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 16,
          child: Container(
            height: 400,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Fare Rules",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: WebViewWidget(
                    controller: controller,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {},
        builder: (context, snapshot) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBarView(
                    title: 'Review Your Flight',
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
                          isDetailed:
                              widget.flight.segments!.length > 1 ? true : false,
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
                        ElevatedButton(
                          onPressed: () {
                            showWebViewPopup(context);
                          },
                          child: const Text("Fare Rules"),
                        ),
                        10.verticalSpace,
                        40.verticalSpace,
                        RoundedBtn(
                          title: "Select Flight",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FlightBookingScreen(
                                homeCubit: widget.homeCubit,
                                itemId: widget.itemId,
                                flight: widget.flight,
                              ),
                            ),
                          ),
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
