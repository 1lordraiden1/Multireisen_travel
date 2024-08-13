import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/config/routes/app_routes.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/room/room_models/child_model.dart';
import 'package:qfly/presentation/screens/flight/components/flight_destination_view.dart';
import 'package:qfly/presentation/screens/flight/components/ticket/ticket_view.dart';
import 'package:qfly/presentation/screens/review_flight/review_flight_screen.dart';
import 'package:qfly/presentation/widgets/app_bar/custom_app_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightListScreen extends StatefulWidget {
  const FlightListScreen({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  State<FlightListScreen> createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    // clear old data
    widget.homeCubit.flight.clear();

    // get init data (page 1)
    widget.homeCubit.handleSearchingForFlights(
      widget.homeCubit.airportFrom.code.isEmpty
          ? "CAI"
          : widget.homeCubit.airportFrom.code,
      widget.homeCubit.airportTo.code.isEmpty
          ? "RUH"
          : widget.homeCubit.airportTo.code,
      widget.homeCubit.adults,
      Child.getChildrenAges(widget.homeCubit.flightChildren),
      widget.homeCubit.selectedClassType,
      widget.homeCubit.flightDate,
      widget.homeCubit.isDirect,
    );

    // get remaining pages

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.homeCubit.filterFlightSearch();
      }
    });

    //_startTimer();
  }

  int _seconds = 0;
  bool _isRunning = false;
  //late Timer _timer;
/* 
  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
        _seconds = 900; // Set your desired countdown duration (in seconds)
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_seconds > 0) {
          setState(() {
            _seconds--;
          });
        } else {
          _cancelTimer();
          /* timer.cancel();
          setState(() {
            _isRunning = false;
          }); */
        }
      });
    }
  }

  void _cancelTimer() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = false;
        _seconds = 0;
      });
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.splashRoute,
        (route) => false,
      );
    }
  }
 */
  @override
  void dispose() {
    //_timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //bool isLoading = false;
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {
          if (state is SearchingEntitiesState) {
            callerWidget = showDataWidget(widget.homeCubit, _scrollController);
          }
          if (state is NoDataFoundState) {
            callerWidget = const Center(child: Text('No Results Found'));
          }
        },
        builder: (context, snapshot) {
          return Scaffold(
            body: Column(
              children: [
                CustomAppBarView(
                  title: 'Time Remaining: ${_seconds ~/ 60} : ${_seconds % 60}',
                ),
                FlightDestinationView(
                  homeCubit: widget.homeCubit,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: widget.homeCubit
                            .isSearchFlightLoading // widget.homeCubit.isSearchFlightLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : callerWidget,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

Widget callerWidget = Center(
  child: CircularProgressIndicator(),
);

Widget showDataWidget(HomeCubit homeCubit, ScrollController scrollController) {
  return ListView.builder(
    controller: scrollController,
    itemCount: homeCubit.entities.length,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewFlightScreen(
                flight: homeCubit.entities[index],
                homeCubit: homeCubit,
                itemId: homeCubit.entities[index].itemId!,
              ),
            )),
        child: TicketView(
          homeCubit: homeCubit,
          flight: homeCubit.entities[index],
        ),
      );
    },
  );
}
