import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/config/theme/app_theme.dart';
import 'package:qfly/constant/assets_manager.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/data/model/responses/airports_response.dart';
//import 'package:qfly/data/model/responses/airports_response.dart';
import 'package:qfly/data/services/home_services.dart';
import 'package:qfly/presentation/widgets/btn_shapes/rounded_btn_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/box_text_view.dart';
import 'package:qfly/presentation/widgets/text_shapes/text_input_view.dart';
import 'package:qfly/utils/media_query_values.dart';

class AirportScreen extends StatefulWidget {
  AirportScreen({
    super.key,
    required this.isWhereFrom,
    required this.homeCubit,
    required this.title,
    required this.subtitle,
  });
  bool isWhereFrom;
  HomeCubit homeCubit;
  String title;
  String subtitle;

  @override
  State<AirportScreen> createState() => _AirportScreenState();
}

class _AirportScreenState extends State<AirportScreen> {
  final TextEditingController _controller = TextEditingController();
  late List<Airport> searchAirports = [];
  late List<Airport> popularAirports = [];

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    popularAirports = widget.homeCubit.airport;
    super.initState();
  }

  void updateList(String value) {
    setState(
      () {
        searchAirports = widget.homeCubit.airport
            .where(
              (element) => element.name!.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
            )
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      listener: (context, state) {},
      builder: (builder, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.title,
                      style: TextStylesManager.mediumStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _controller,
                    onChanged: (value) => updateList(value),
                  ),
                ],
              ),
            ),
            _controller.text.isEmpty
                ? SizedBox(
                    height: context.height - 450,
                    child: ListView.builder(
                      itemCount: popularAirports.length,
                      itemBuilder: (context, index) {
                        final airport = popularAirports[index];
                        return GestureDetector(
                          onTap: () {
                            widget.homeCubit.selectingAirport(
                              airport,
                              widget.isWhereFrom,
                            );
                            _controller.clear();
                            Navigator.pop(context);
                          },
                          child: ListTile(
                            title: Text(airport.name!),
                            subtitle: Text(airport.country!),
                            trailing: BoxTextView(text: airport.code!),
                          ),
                        );
                      },
                    ),
                  )
                : SizedBox(
                    height: context.height - 450, //300,
                    child: searchAirports.isEmpty
                        ? const Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            itemCount: searchAirports.length,
                            itemBuilder: (context, index) {
                              final airport = searchAirports[index];
                              return GestureDetector(
                                onTap: () {
                                  widget.homeCubit.selectingAirport(
                                    airport,
                                    widget.isWhereFrom,
                                  );
                                  _controller.clear();
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text(airport.name!),
                                  subtitle: Text(airport.country!),
                                  trailing: BoxTextView(
                                    text: airport.code!,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
            const SizedBox(
              height: 10,
            ),
            RoundedBtn(
              title: 'Done',
              onTap: () {
                widget.homeCubit.selectingAirport(
                  widget.homeCubit.airport.first,
                  widget.isWhereFrom,
                );
                Navigator.pop(context);
              },
            ).build(context),
          ],
        );
      },
    );
  }
}
