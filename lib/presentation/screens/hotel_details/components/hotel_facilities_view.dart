import 'package:flutter/material.dart';
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:qfly/data/model/responses/hotel/hotel_details_response.dart';
import 'package:qfly/presentation/screens/hotel_details/components/facility_item.dart';
import 'package:qfly/presentation/widgets/category_header_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelFacilitiesView extends StatefulWidget {
  const HotelFacilitiesView({
    super.key,
    required this.homeCubit,
    required this.facility,
  });

  final HomeCubit homeCubit;
  final Facility facility;

  @override
  State<HotelFacilitiesView> createState() => _HotelFacilitiesViewState();
}

class _HotelFacilitiesViewState extends State<HotelFacilitiesView> {
  late List<String> facilities;
  @override
  void initState() {
    prepareText();
    super.initState();
  }

  late List<String> extractedTexts;
  prepareText() {
    RegExp exp = RegExp(r's:\d+:"(.*?)";');
    Iterable<Match> matches = exp.allMatches(widget.facility.text!);
    facilities = matches.map((match) => match.group(1)!).toList();
  }

  void showFacilitiesPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 16,
          child: Container(
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Facilities",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: facilities.length,
                    itemBuilder: (context, index) {
                      return FacilityItem(
                        homeCubit: widget.homeCubit,
                        facility: facilities[index],
                      );
                    },
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
    return Column(
      children: [
        CategoryHeaderView(
          title: 'Hotel Facilities',
          onPressed: () {
            showFacilitiesPopup(context);
          },
        ),
        14.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              facilities.length,
              (index) => FacilityItem(
                homeCubit: widget.homeCubit,
                facility: facilities[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
