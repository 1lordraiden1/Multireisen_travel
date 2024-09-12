import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qfly/data/model/hotel/hotel.dart';

import 'package:qfly/data/model/responses/get_ticket_response.dart';
import 'package:qfly/data/model/room/request_room_model.dart';

import 'package:qfly/utils/validation.dart';

import '../../../../constant/colors.dart';

class HotelPassengersWidget extends StatelessWidget {
  const HotelPassengersWidget({
    super.key,
    required this.homeCubit,
    required this.hotel,
  });

  final HomeCubit homeCubit;
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Provide Traveler details',
          style: TextStylesManager.mediumStyle(fontSize: 18.sp),
        ),
        10.verticalSpace,
        ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: RoomItem.calculateAdultsInRooms(
            homeCubit.requestRooms,
          ),
          itemBuilder: (context, index) {
            return PassengerForm(
              passenger: homeCubit.passengers[index],
              homeCubit: homeCubit,
              travelerNumber: index + 1,
              type: "Adult",
            );
          },
        ),
        RoomItem.calculateChildrenInRooms(
                  homeCubit.requestRooms,
                ) >
                0
            ? ListView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: RoomItem.calculateChildrenInRooms(
                  homeCubit.requestRooms,
                ),
                itemBuilder: (context, index) {
                  return PassengerForm(
                    passenger: homeCubit.passengers[index +
                        RoomItem.calculateAdultsInRooms(
                          homeCubit.requestRooms,
                        )],
                    homeCubit: homeCubit,
                    travelerNumber: index +
                        RoomItem.calculateAdultsInRooms(
                          homeCubit.requestRooms,
                        ) +
                        1,
                    type: "Child",
                  );
                },
              )
            : const SizedBox.shrink(),

        /*   Text(
                '*Note : Please ensure the name you enter is matching to your National ID / Passport ',
                style:
                    TextStylesManager.regularStyle(fontSize: 10.sp, color: red),
              ), */
        Text(
          '*Note : Please ensure the accurate contact details of the passenger (as in ID Proof), so that the Airline can update the passenger about any changes and request to verify the Visa and airline transit information before proceeding with the booking to avoid any inconvenience/ADM from the respective carrier. Please note that several countries have imposed entry restrictions because of the novel coronavirus(COVID-19) outbreak, kindly verify the checklist on the airlines official website. ',
          style: TextStylesManager.regularStyle(fontSize: 10.sp, color: red),
        ),
        20.verticalSpace,
      ],
    );
  }
}

class PassengerForm extends StatefulWidget {
  const PassengerForm({
    super.key,
    required this.homeCubit,
    required this.travelerNumber,
    required this.type,
    this.showDate,
    required this.passenger,
  });

  final HomeCubit homeCubit;
  final Passenger passenger;
  final int travelerNumber;
  final String type;
  final DateTime? Function(String?)? showDate;

  @override
  State<PassengerForm> createState() => _PassengerFormState();
}

class _PassengerFormState extends State<PassengerForm> {
  final ExpansionTileController expansionTileController =
      ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _firstController = TextEditingController(
      text: widget.passenger.firstName!,
    );
    final _lastController = TextEditingController(
      text: widget.passenger.firstName!,
    );

    final _nationalityController = TextEditingController(
      text: widget.passenger.firstName!,
    );

    return ExpansionTile(
      controller: expansionTileController,
      /* onExpansionChanged: (bool expanded) {
        setState(() {
          expanded
              ? expansionTileController.collapse()
              : expansionTileController.expand();
        });
      }, */
      maintainState: true,
      initiallyExpanded: true,
      title: Text(
        'Traveler ${widget.travelerNumber} (${widget.type})',
        style: TextStylesManager.regularStyle(fontSize: 14.sp),
      ),
      children: [
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Traveler ${widget.travelerNumber} (${widget.type})',
                style: TextStylesManager.regularStyle(fontSize: 14.sp),
              ),
              8.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _firstController,
                homeCubit: widget.homeCubit,
                label: 'First Name',
                validation: (value) {
                  return Validation().emptyField(value, 'First Name');
                },
                onSaved: (value) {
                  widget.passenger.firstName = value;
                },
              ),
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _lastController,
                homeCubit: widget.homeCubit,
                label: 'Last Name',
                validation: (value) {
                  return Validation().emptyField(value, 'Last Name');
                },
                onSaved: (value) {
                  widget.passenger.lastName = value;
                },
              ),
              10.verticalSpace,
              FormBuilderDateTimePicker(
                enableInteractiveSelection: false,
                name: 'Birth Date',
                decoration: InputDecoration(
                  label: Text('Birth Date'),
                  labelStyle: TextStylesManager.lightStyle(),
                  border: const OutlineInputBorder(),
                  icon: Icon(Icons.date_range_outlined),
                ),
                onSaved: (newValue) {
                  DateTime now = DateTime.now();
                  widget.passenger.type = widget.homeCubit.getPassengerType(
                    widget.type,
                    now.difference(newValue!).inDays,
                  );
                  widget.passenger.birthDate = newValue;
                },
              ),
              10.verticalSpace,
              OutlinedInputFieldWidget(
                controller: _nationalityController,
                homeCubit: widget.homeCubit,
                label: 'Nationality',
                validation: (value) {
                  return Validation().emptyField(value, 'Country Exist ');
                },
                onSaved: (value) {
                  widget.passenger.nationality = value;
                },
              ),
              10.verticalSpace,
              FormBuilderRadioGroup(
                name: 'Gender',
                initialValue: 1,
                separator: SizedBox(width: 30),
                options: [
                  const FormBuilderFieldOption(
                    value: 1,
                    child: Text('Male'),
                  ),
                  const FormBuilderFieldOption(
                    value: 2,
                    child: Text('Female'),
                  ),
                ],
                onSaved: (newValue) {
                  widget.passenger.title = newValue == 2 ? 'Mrs' : 'Mr';
                },
              ),
              10.verticalSpace,
              TextButton(
                child: const Text("Confirm"),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(primaryColor),
                  foregroundColor: const WidgetStatePropertyAll(white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(widget.passenger.toJson());
                    expansionTileController.isExpanded
                        ? expansionTileController.collapse()
                        : null;
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OutlinedInputFieldWidget extends StatelessWidget {
  const OutlinedInputFieldWidget({
    super.key,
    required this.homeCubit,
    required this.label,
    this.validation,
    this.isDate = false,
    this.onSaved,
    this.showDate,
    this.controller,
    this.controllerValue,
  });
  final HomeCubit homeCubit;
  final String label;
  final String? Function(String?)? validation;
  final bool? isDate;
  final void Function(String?)? onSaved;
  final DateTime? Function(String?)? showDate;
  final TextEditingController? controller;
  final String? controllerValue;

  @override
  Widget build(BuildContext context) {
    return isDate!
        ? BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now(),
                  ).then(
                    (value) {
                      homeCubit.handleFlightBirthDateChanging(value!);
                    },
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeCubit.flightBirthDate
                                  .toString()
                                  .substring(0, 10),
                            ),
                            Icon(
                              Icons.date_range_outlined,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : TextFormField(
            initialValue: controllerValue,
            enabled: !isDate!,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStylesManager.lightStyle(),
              border: const OutlineInputBorder(),
            ),
            validator: validation,
            onSaved: onSaved,
            controller: controller,
          );
  }
}
