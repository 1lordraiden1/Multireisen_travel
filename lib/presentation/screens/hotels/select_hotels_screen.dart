import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/room/room_data_model.dart';
import 'package:qfly/presentation/screens/hotels/components/select_hotel_body.dart';

class SelectHotelScreen extends StatefulWidget {
  const SelectHotelScreen({super.key, required this.homeCubit});

  final HomeCubit homeCubit;

  @override
  State<SelectHotelScreen> createState() => _SelectHotelScreenState();
}

class _SelectHotelScreenState extends State<SelectHotelScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.homeCubit.searchHotelsHandler(
      widget.homeCubit.city.name!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      listener: (context, state) {
        if (state is NoDataFoundState) {
          callerWidget = Center(
            child: Text('No Data Found'),
          );
        }
        if (state is NoHotelDataFoundState) {
          callerWidget = Center(
            child: Text(state.error),
          );
        }
        if (state is LoadHotelsState) {
          callerWidget = showHotels(
            widget.homeCubit,
          );
        }
      },
      builder: (context, snapshot) {
        return Scaffold(
          body: widget.homeCubit.isSearchHotelsLoading
              ? callerWidget = const Center(
                  child: CircularProgressIndicator(),
                )
              : callerWidget,
        );
      },
    );
  }
}

Widget callerWidget = const Center(
  child: CircularProgressIndicator(),
);

Widget showHotels(HomeCubit homeCubit) {
  return SelectHotelBody(
    homeCubit: homeCubit,
  );
}
