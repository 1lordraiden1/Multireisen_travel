import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:qfly/constant/app_strings.dart';
import 'package:qfly/data/Shared/sharedPreferences.dart';
import 'package:qfly/data/model/Flight/Flight_details_model.dart';
import 'package:qfly/data/model/Flight/Flight_model.dart';

import 'package:qfly/data/model/airport_model.dart';
import 'package:qfly/data/model/hotel/hotel.dart';
import 'package:qfly/data/model/responses/finalize_booking_response.dart';
import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/data/model/responses/get_ticket_response.dart';
import 'package:qfly/data/model/responses/hotel/cities_response.dart'
    hide Country;
import 'package:qfly/data/model/responses/hotel/countries_response.dart';
import 'package:qfly/data/model/responses/hotel/hotel_details_response.dart'
    as hotel_details hide Image;
import 'package:qfly/data/model/responses/hotel/hotel_response.dart'
    hide Entity, Room, Image;
import 'package:qfly/data/model/responses/hotel/room_filter_response.dart'
    hide Entity;
import 'package:qfly/data/model/responses/hotel/select_hotel_response.dart'
    hide Image, Room;
import 'package:qfly/data/model/responses/issue_ticket_response.dart';
import 'package:qfly/data/model/responses/save_passengers_response.dart';
import 'package:qfly/data/model/responses/select_flight_response.dart';
import 'package:qfly/data/model/room/request_room_model.dart';
import 'package:qfly/data/model/room/room_data_model.dart';
import 'package:qfly/data/model/room/room_models/child_model.dart';
import 'package:qfly/data/services/api_services.dart';
import 'package:qfly/data/services/auth_services.dart';
import 'package:qfly/data/services/home_services.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeCubit extends Bloc<HomeEvent, HomeState> {
  HomeCubit() : super(HomeInitial());

  // Global

  // Dio

  Dio dio = Dio();

  /* ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Print the original request URL
        print("Original Request URL: ${options.uri}");

        print(options.data);

        // Modify the query parameters manually to prevent URL encoding
        /*  final modifiedQueryParameters =
            Map<String, dynamic>.from(options.queryParameters);
        modifiedQueryParameters.forEach((key, value) {
          if (key == "children_ages") {
            modifiedQueryParameters[key] = Uri.decodeComponent(value);
          }
          if (value is String && value.contains('%2C')) {
            modifiedQueryParameters[key] = Uri.decodeComponent(value);
          }
        });

        // Rebuild the request URL with modified query parameters
        options.queryParameters = modifiedQueryParameters;

        // Print the modified request URL
        print("Modified Request URL: ${options.uri}");

        return handler.next(options); */
      },
      onResponse: (response, handler) {
        print("Response : ${response.data}");
        // Optionally log response
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("Request Error: ${e.message}");
        return handler.next(e);
      },
    )); */

  // Home Data

  int topFlightCurrentItem = 0;

  changeTopFlightIndex(int index) {
    topFlightCurrentItem = index;
    emit(TopFlightItemIsChanged(index));
  }

  int _serviceIndex = 0;
  int get serviceIndex => _serviceIndex;
  selectService(int index, BuildContext context) {
    _serviceIndex = index;

    //_handleServiceAction(context);
    emit(ServiceIsChanged(index));
  }

  /*  _handleServiceAction(context) {
    if (_serviceIndex == 0) {
      Navigator.pushNamed(context, Routes.flightListRoute);
    } else if (_serviceIndex == 2) {
      Navigator.pushNamed(context, Routes.selectHotelRoute);
    }
  } */

  // Flight Data

  // Init
  /*  static List<Country> _countries = []; */
  static List<Airport> _airports = [];
  static List<Airport> _popularAirports = [];
  final List<String> _classTypes = ['Economy', 'Second Class', 'First Class'];
  static List<Flight> _flights = [];
  static List<Entity> _entities = [];

  static String _whereFrom = "Where From?";
  static String _whereTo = "Where To?";

  DateTime _flightDate = DateTime.now();
  DateTime _flightBirthDate = DateTime.now();

  int _adults = 1;
  int _children = 0;
  List<Child> _flightChildren = [];
  int _infant = 0;

  Airport _selectedWhereFrom = Airport.empty();
  Airport _selectedWhereTo = Airport.empty();

  Map<String, dynamic> _booking = {};
  Map<String, dynamic> _details = {};
  FareQuote _fareQuote = FareQuote.empty();

  int _selectedClassType = 0;
  int flightSearchPage = 1;

  bool isSearchDataLoading = false;
  bool isSearchFlightLoading = false;
  bool isFilterSearchLoading = false;
  bool isFlightSelectionLoading = false;
  bool isSearchFlightDetailsLoading = false;
  bool isStillBooking = false;

  bool isSavePassengersLoading = false;
  bool isBookingFinalizationLoading = false;

  bool isIssuingTicketLoading = false;
  bool isGettingTicketLoading = false;

  bool _isDirect = false;

  Map<String, dynamic> _ticketData = {};

  Map<String, dynamic> _bookedTicket = {};

  List<Passenger> _passengers = [];

  // Getters
  String get whereFrom => _whereFrom;
  String get whereTo => _whereTo;
  Airport get airportFrom => _selectedWhereFrom;
  Airport get airportTo => _selectedWhereTo;

  Map<String, dynamic> get details => _details;
  Map<String, dynamic> get booking => _booking;
  FareQuote get fareQuote => _fareQuote;

  DateTime get flightDate => _flightDate;
  DateTime get flightBirthDate => _flightBirthDate;

  /*  List<Country> get countries => _countries; */

  bool get isDirect => _isDirect;

  int get selectedClassType => _selectedClassType;

  int get adults => _adults;
  int get children => _children;
  List<Child> get flightChildren => _flightChildren;
  int get infant => _infant;

  Future<List<Airport>> get futureAirport async => _airports;
  List<Airport> get popularAirports => _popularAirports;
  List<Airport> get airport => _airports;
  List<String> get classTypes => _classTypes;
  List<Flight> get flight => _flights;
  List<Entity> get entities => _entities;

  Map<String, dynamic> get ticketData => _ticketData;
  Map<String, dynamic> get bookedTicket => _bookedTicket;

  List<Passenger> get passengers => _passengers;

  // Responses

  FlightResponse _flightResponse = FlightResponse.fromJson(
    {},
  );

  FlightResponse _filterFlightResponse = FlightResponse.fromJson(
    {},
  );

  SelectFlightResponse _selectFlightResponse = SelectFlightResponse.fromJson(
    {},
  );

  SavePassengersResponse _savePassengersResponse =
      SavePassengersResponse.fromJson(
    {},
  );

  FinalizeBookingResponse _finalizeBookingResponse =
      FinalizeBookingResponse.fromJson(
    {},
  );

  IssueTicketResponse _issueTicketResponse = IssueTicketResponse.fromJson(
    {},
  );

  GetTicketResponse _getTicketResponse = GetTicketResponse.fromJson(
    {},
  );

  // Responses' getters

  FlightResponse get flightResponse => _flightResponse;

  FlightResponse get filterFlightResponse => _filterFlightResponse;

  SelectFlightResponse get selectFlightResponse => _selectFlightResponse;

  SavePassengersResponse get savePassengersResponse => _savePassengersResponse;

  FinalizeBookingResponse get finalizeBookingResponse =>
      _finalizeBookingResponse;

  IssueTicketResponse get issueTicketResponse => _issueTicketResponse;

  GetTicketResponse get getTicketResponse => _getTicketResponse;

  // Flight Functions
/* 
  FutureOr<void> handleWhereFromChanging(Country country) {
    _whereFrom = country.name;
    _iconFrom = country.icon;
    emit(
      ChangeWhereFromWidgetData(
        whereFrom: country.name,
        iconFrom: country.icon,
      ),
    );
  }

  handleWhereToChanging(Country country) {
    _whereTo = country.name;
    _iconTo = country.icon;
    emit(
      ChangeWhereToWidgetData(
        whereTo: country.name,
        iconTo: country.icon,
      ),
    );
  } */

/*   getCountries() async {
    final homeServices = HomeServices();
    _countries = await homeServices.getCountries();
    emit(HomeLoadCountries(_countries)); // last
  }

  FutureOr<void> changeWhereFromEvent(
      ChangeWhereFromEvent event, Emitter<HomeState> emit) async {
    emit(
      ChangeWhereFromWidgetData(
        whereFrom: event.wf,
        iconFrom: event.iconf,
      ),
    );
  } */

  getAirportsData(String searchValue) async {
    try {
      isSearchDataLoading = true;

      final initData = await HomeServices().fetchAirportsData('dx');

      _popularAirports = initData
          .map(
            (e) => Airport.fromJson(e),
          )
          .toList();

      final data = await HomeServices().fetchAirportsData(searchValue);

      _airports = data
          .map(
            (e) => Airport.fromJson(e),
          )
          .toList();

      emit(AirportDataImportedSuccessfully(
          airports: _airports, popularAirports: _popularAirports));
    } catch (e) {
      isSearchDataLoading = false;
      throw Exception('Failed to load airports from HomeCubit');
    } finally {
      isSearchDataLoading = false;
    }
  }

  selectingAirport(Airport a, bool isWhereFrom) {
    isWhereFrom ? _selectedWhereFrom = a : _selectedWhereTo = a;

    emit(SelectingAirportState(
      airportUpdate: isWhereFrom ? _selectedWhereFrom : _selectedWhereTo,
    ));
  }

  switchAirports() {
    Airport temp = _selectedWhereFrom;
    _selectedWhereFrom = _selectedWhereTo;
    _selectedWhereTo = temp;

    emit(SwitchCAirportsState(
      a1: _selectedWhereFrom,
      a2: _selectedWhereTo,
    ));
  }

  handleFlightDateChanging(DateTime date) {
    _flightDate = date;
    emit(ChangeCheckInDate(checkInDate: _flightDate));
  }

  handleFlightBirthDateChanging(DateTime date) {
    _flightBirthDate = date;
    emit(ChangeFlightBirthDateState(date: _flightBirthDate));
  }

  handleDirectFlightChanging(bool value) {
    _isDirect = value;
    emit(ChangingFlightDirectState(isDirect: _isDirect));
  }

  handleFlightAdultsChanges(int adultCount, String operation) {
    if (operation == '+') {
      if (adultCount < 5) {
        adultCount++;
      }
    } else {
      if (adultCount > 1) {
        adultCount--;
      }
    }
    _adults = adultCount;
    emit(ChangeFlightAdults(adults: _adults));
  }

  handleFlightChildrenChanges(int childCount, String operation) {
    if (operation == '+') {
      if (childCount < 5) {
        _flightChildren.add(Child.empty());
        childCount++;
      }
    } else {
      if (childCount > 0) {
        _flightChildren.remove(_flightChildren[_flightChildren.length - 1]);
        childCount--;
      }
    }
    _children = childCount;
    emit(ChangeFlightChildren(
      children: _children,
      flightChildren: _flightChildren,
    ));
  }

  handleFlightInfantChanges(int childCount, String operation) {
    if (operation == '+') {
      if (childCount < 5) {
        childCount++;
      }
    } else {
      if (childCount > 0) {
        childCount--;
      }
    }
    _infant = childCount;
    emit(ChangeFlightInfants(infants: _infant));
  }

  handleClassTypeSelection(String type) {
    switch (type) {
      case 'Economy':
        _selectedClassType = 0;
        break;

      case 'Second Class':
        _selectedClassType = 1;
        break;

      default:
        _selectedClassType = 2;
    }
    emit(ClassTypeSelectionState(selectedClassType: _selectedClassType));
  }

  handleSearchingForFlights(
    String origin,
    String destination,
    int adultCount,
    List<int> childAges,
    int classType,
    DateTime departureTime,
    bool isDirect,
  ) async {
    isSearchFlightLoading = true;
    try {
      final FlightResponse response = await ApiServices(dio).getFlights(
        await AuthService().getOurAuth(),
        'v1',
        StringsManager.ourToken,
        StringsManager.contentType,
        StringsManager.contentType,
        {
          "adults": adultCount,
          "children": childAges,
          "segments": [
            /* {
            "originCode": "BER",
            "destinationCode": "PAR",
            "departureDate": "2025-02-12",
            "departureTime": "0"
        }, */
            {
              "originCode": origin,
              "destinationCode": destination,
              "departureDate": departureTime.toString().substring(0, 10),
              "departureTime": "0"
            }
          ],
          "flexSearch": "0",
          "stops": isDirect ? "-1" : "1",
          "class": "0"
        },
      );

      _flightResponse = response;

      if (response.error != null) {
        isSearchFlightLoading = false;
        print(response.error!.message.toString());
        emit(NoDataFoundState());
        return;
      }

      _entities = response.data!.entities!;
      print(_entities.length);
      print(" Number of Entities : ${_entities}");

      emit(SearchingEntitiesState(entities: _entities));
    } catch (e) {
      onError(e, StackTrace.current);
      emit(NoDataFoundState());
      //throw Exception(e.toString());
    } finally {
      isSearchFlightLoading = false;
    }
  }

  filterFlightSearch() async {
    isFilterSearchLoading = true;
    flightSearchPage++;

    print("Starting Filter Search");

    final FlightResponse response = await ApiServices(dio).filterSearch(
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      'v1',
      StringsManager.ourToken,
      StringsManager.contentType,
      flightSearchPage,
    );

    _filterFlightResponse = response;

    if (response.error != null) {
      isFilterSearchLoading = false;
      print(response.error!.message.toString());
      return;
    }

    print(" Number of Entities Before adding : ${_entities.length}");

    _entities.addAll(response.data!.entities!);

    print(" Number of Entities Before adding : ${_entities.length}");

    emit(SearchingEntitiesState(entities: _entities));

    isFilterSearchLoading = false;

    //throw Exception(e.toString());
  }

  selectFlight(String itemId) async {
    // Loading
    isFlightSelectionLoading = true;

    // getting response
    final SelectFlightResponse response = await ApiServices(dio).selectFlight(
      itemId,
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      'v1',
      StringsManager.ourToken,
      StringsManager.contentType,
    );

    _selectFlightResponse = response;

    if (response.error != null) {
      isFlightSelectionLoading = false;
      print(response.error!.message.toString());
      emit(NoDataFoundState());
      return;
    }

    print(_selectFlightResponse.data!.payModes![0].id);

    emit(FlightSelectionState(selectFlightResponse: _selectFlightResponse));

    //_entities = response.data!.entities!;

    isFlightSelectionLoading = false;
  }

  savePassengers(itemId) async {
    isSavePassengersLoading = true;

    // getting response
    final SavePassengersResponse response =
        await ApiServices(dio).savePassengers(
      itemId,
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      'v1',
      StringsManager.ourToken,
      StringsManager.contentType,
      StringsManager.contentType,
      {
        "passengers": [
          {
            "type": "ADT",
            "title": "MR",
            "firstName": "John",
            "lastName": "Doe",
            "birthDate": "1978-01-01",
            "nationality": "DE",
            "passport": {
              "type": "P",
              "number": "1234567",
              "issueCountry": "DE",
              "expiry": "2025-05-01"
            },
            /* "options": {
              "1": {"id": "OutwardLuggageOptions", "value": "1"},
              "2": {"id": "ReturnLuggageOptions", "value": "1"}
            } */
          },
          /* {
            "type": "ADT",
            "title": "MRS",
            "firstName": "Helene",
            "lastName": "Doe",
            "birthDate": "1963-08-01",
            "nationality": "DE",
            "passport": {
              "type": "P",
              "number": "456546",
              "issueCountry": "DE",
              "expiry": "2025-09-01"
            },
            /* "options": {
              "1": {"id": "OutwardLuggageOptions", "value": "1"},
              "2": {"id": "ReturnLuggageOptions", "value": "1"}
            } */
          },
          {
            "type": "CHD",
            "title": "MR",
            "firstName": "Jason",
            "lastName": "Doe",
            "birthDate": "2016-06-01",
            "nationality": "DE",
            "passport": {
              "type": "P",
              "number": "3456786783456",
              "issueCountry": "DE",
              "expiry": "2029-10-11"
            }
          },
          {
            "type": "INF",
            "title": "MS",
            "firstName": "Baby",
            "lastName": "Doe",
            "birthDate": "2024-02-01",
            "nationality": "DE",
            "passport": {
              "type": "P",
              "number": "3456783456",
              "issueCountry": "DE",
              "expiry": "2029-10-11"
            }
          } */
        ],
        "contact": {
          "title": "MR",
          "firstName": "Contact",
          "lastName": "Person",
          "phone": "+49-12-3456789",
          "email": "user_23432@gmail.com",
          "country": "DE",
          "zip": "34663",
          "city": "Berlin",
          "address": "Some street 1."
        },
        /* "invoice": {
        "name": "Multiresisen Gmbh.",
        "country": "DE",
        "zip": "34663",
        "city": "Berlin",
        "address": "Some street 1."
    },
    "options": [
        {
            "id": "SpeedyBoarding",
            "value": "1"
        }
    ], */
        "paymentId": "9"
      },
    );

    _savePassengersResponse = response;

    if (response.data == null) {
      isSavePassengersLoading = false;
      print("Error in User Data");
      emit(NoDataFoundState());
      return;
    }

    print(
      " Booking ID!! : ${_savePassengersResponse.data!.bookingId!.toString()}",
    );

    emit(SavingPassengerState(savePassengersResponse: _savePassengersResponse));

    finalizeBooking(itemId);

    isSavePassengersLoading = false;
  }

  finalizeBooking(String itemId) async {
    isBookingFinalizationLoading = true;

    // getting response
    final FinalizeBookingResponse response =
        await ApiServices(dio).finalizeBooking(
      itemId,
      _savePassengersResponse.data!.bookingId!.toString(),
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      'v1',
      StringsManager.ourToken,
      StringsManager.contentType,
      StringsManager.contentType,
    );

    _finalizeBookingResponse = response;

    if (response.error != null) {
      isBookingFinalizationLoading = false;
      print(response.error!.message.toString());
      emit(NoDataFoundState());
      return;
    }

    print(
      " Final Booking ID!! : ${_savePassengersResponse.data!.bookingId!.toString()}",
    );
    emit(FinalizingBookingState(
      finalizeBookingResponse: _finalizeBookingResponse,
    ));

    //_entities = response.data!.entities!;

    isBookingFinalizationLoading = false;
  }

  issueTicket(String bookingId, String bookingItemId) async {
    isIssuingTicketLoading = true;

    // getting response
    final IssueTicketResponse response = await ApiServices(dio).issueTicket(
      bookingId,
      bookingItemId,
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      'v1',
      StringsManager.contentType,
      StringsManager.ourToken,
    );

    _issueTicketResponse = response;

    if (response.error != null) {
      isIssuingTicketLoading = false;
      print(response.error!.message.toString());
      emit(NoDataFoundState());
      return;
    }

    print(
      " Issued Ticket Message!! : ${_issueTicketResponse.data!.messages!.first.text!.toString()}",
    );

    print(
      " Issued Ticket Status!! : ${_issueTicketResponse.data!.success!.toString()}",
    );
    emit(
      IssuingTicketState(
        issueTicketResponse: _issueTicketResponse,
      ),
    );

    //_entities = response.data!.entities!;

    isIssuingTicketLoading = false;

    getTicket(bookingId, bookingItemId);
  }

  getTicket(String bookingId, String bookingItemId) async {
    isGettingTicketLoading = true;

    // getting response
    final GetTicketResponse response = await ApiServices(dio).getTicket(
      bookingId,
      bookingItemId,
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      'v1',
      StringsManager.contentType,
      StringsManager.ourToken,
    );

    _getTicketResponse = response;

    if (response.error != null) {
      isGettingTicketLoading = false;
      print(response.error!.message.toString());
      emit(NoDataFoundState());
      return;
    }

    print(
      " Got Ticket Reserve Code!! : ${_getTicketResponse.data!.properties!.airlineReservationCode!.toString()}",
    );
    emit(GettingTicketState(
      getTicketResponse: _getTicketResponse,
    ));

    //_entities = response.data!.entities!;

    isGettingTicketLoading = false;
  }

  handleGettingFlightDetails(
    String pointOfSale,
    String origin,
    String resultId,
    bool isLcc,
    String companyName,
  ) async {
    isSearchFlightDetailsLoading = true;
    try {
      final Map<String, dynamic> data =
          await HomeServices().searchForFlightDetails(
        pointOfSale,
        origin,
        resultId,
        isLcc,
        companyName,
      );

      if (data['errors'] != null) {
        isSearchFlightDetailsLoading = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isSearchFlightDetailsLoading = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }
      _details = data;

      _fareQuote = FareQuote.fromJson(data);

      emit(GettingFlightDetailsState(details: _fareQuote));
    } catch (e) {
      isSearchFlightDetailsLoading = false;
      emit(GettingAlreadyBookedTicketState());
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isSearchFlightDetailsLoading = false;
    }
  }

  handleGettingTicketDetails({
    required Map<String, dynamic> fare,
    required Map<String, dynamic> fareRules,
    required List<dynamic> segment,
    required String pointOfSale,
    required String origin,
    required String resultId,
    required String companyName,
    required bool isLcc,
    required String originAirportCode,
    required String desAirportCode,
    required String airlineCode,
    required String responseTime,
  }) async {
    isSearchFlightDetailsLoading = true;

    try {
      final Map<String, dynamic> data =
          await HomeServices().gettingTicketWhenLCCisTrue(
        fare,
        fareRules,
        segment,
        pointOfSale,
        origin,
        resultId,
        companyName,
        isLcc,
        originAirportCode,
        desAirportCode,
        airlineCode,
        responseTime,
      );

      if (data['errors'] != null) {
        isSearchFlightDetailsLoading = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isSearchFlightDetailsLoading = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }

      _ticketData = data;

      emit(GettingTicketDetailsState(ticketData: _ticketData));
    } catch (e) {
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isSearchFlightDetailsLoading = false;
    }
  }

  handleBookingTicketProcess({
    required Map<String, dynamic> fare,
    required Map<String, dynamic> fareRules,
    required List<dynamic> segment,
    required String pointOfSale,
    required String origin,
    required String resultId,
    required String companyName,
    required bool isLcc,
    required String originAirportCode,
    required String desAirportCode,
    required String airlineCode,
    required String responseTime,
    required String userSearchTime,
    required String lastTicketDate,
    required String ticketAdvisory,
  }) async {
    isStillBooking = true;

    try {
      final Map<String, dynamic> data =
          await HomeServices().gettingBookingWhenLCCisFalse(
        fare,
        fareRules,
        segment,
        pointOfSale,
        origin,
        resultId,
        companyName,
        isLcc,
        originAirportCode,
        desAirportCode,
        airlineCode,
        responseTime,
        userSearchTime,
        lastTicketDate,
        ticketAdvisory,
      );

      if (data['errors'] != null) {
        isStillBooking = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isStillBooking = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }

      _ticketData = data;

      emit(GettingTicketDetailsState(ticketData: _ticketData));

      handleGettingBookedTicketProcess(
        fare: details['fareQuote']['Result'][0]['Fare'],
        fareRules: details['fareQuote']['Result'][0]['FareRules'][0],
        segment: details['fareQuote']['Result'][0]['Segments'][0],
        airlineCode: details['fareQuote']['Result'][0]['ValidatingAirline'],
        companyName: companyName,
        desAirportCode: details['fareQuote']['Result'][0]['Destination'],
        isLcc: details['fareQuote']['Result'][0]['IsLcc'],
        origin: origin,
        originAirportCode: details['fareQuote']['Result'][0]['Origin'],
        pointOfSale: origin,
        responseTime: details['fareQuote']['Result'][0]['ResponseTime'],
        resultId: details['fareQuote']['Result'][0]['ResultId'],
        lastTicketDate: details['fareQuote']['Result'][0]['LastTicketDate'],
        ticketAdvisory: details['fareQuote']['Result'][0]['TicketAdvisory'],
        userSearchTime: flightDate.toString().substring(0, 10),
        createOn: ticketData['Itinerary']['CreatedOn'],
        pnr: ticketData['Itinerary']['PNR'],
      );
    } catch (e) {
      isStillBooking = false;
      emit(GettingAlreadyBookedTicketState());
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isStillBooking = false;
    }
  }

  handleGettingBookedTicketProcess({
    required Map<String, dynamic> fare,
    required Map<String, dynamic> fareRules,
    required List<dynamic> segment,
    required String pointOfSale,
    required String origin,
    required String resultId,
    required String companyName,
    required bool isLcc,
    required String originAirportCode,
    required String desAirportCode,
    required String airlineCode,
    required String responseTime,
    required String userSearchTime,
    required String lastTicketDate,
    required String ticketAdvisory,
    required String createOn,
    required String pnr,
  }) async {
    isSearchFlightDetailsLoading = true;

    try {
      final Map<String, dynamic> data =
          await HomeServices().gettingTicketWhenLCCisFalse(
        fare,
        fareRules,
        segment,
        pointOfSale,
        origin,
        resultId,
        companyName,
        isLcc,
        originAirportCode,
        desAirportCode,
        airlineCode,
        responseTime,
        userSearchTime,
        lastTicketDate,
        ticketAdvisory,
        createOn,
        pnr,
      );

      if (data['errors'] != null) {
        isSearchFlightDetailsLoading = false;
        print(data['errors'].toString());
        data['errors'];
        emit(NoDataFoundState());
        return;
      }

      if (data['status'] == 403) {
        isSearchFlightDetailsLoading = false;
        print(data['massage'].toString());
        emit(NoDataFoundState());
        return;
      }

      _bookedTicket = data;

      emit(GettingBookedTicketState(bookedTicket: _bookedTicket));
    } catch (e) {
      onError(e, StackTrace.current);

      //throw Exception(e.toString());
    } finally {
      isSearchFlightDetailsLoading = false;
    }
  }

  createPassengers(int passengersCount) {
    _passengers = List<Passenger>.generate(
      passengersCount,
      (index) {
        return Passenger.empty();
      },
    );
    emit(CreatingPassengersState(passengers: _passengers));
  }

  // Hotel Data
  // Init

  DateTime _checkInDate = DateTime.now();
  DateTime _checkOutDate = DateTime(2025);

  List<City> _cities = [];
  List<Country> _countries = [];
  Country _country = Country.empty();
  City _city = City.empty();

  int _rooms = 1;

  List<RoomData> _hotelRooms = [
    RoomData.emptyWithId(1),
  ];

  List<Hotel> _hotels = [];

  List<RoomItem> _requestRooms = [
    RoomItem(
      adults: 1,
      children: [],
    ),
  ];

  Image selectedImage = Image(
    url: null,
  );

  hotel_details.HotelDetailsResponse _hotelDetailsResponse =
      hotel_details.HotelDetailsResponse(
    data: null,
  );

  List<Room> _availableRooms = [];

  SelectHotelResponse _selectHotelResponse = SelectHotelResponse();

  RoomFilterResponse _roomFilterResponse = RoomFilterResponse();

  // Getters (Can't Set Data!)

  DateTime get checkInDate => _checkInDate;
  DateTime get checkOutDate => _checkOutDate;

  List<City> get cities => _cities;
  List<Country> get countries => _countries;
  Country get country => _country;
  City get city => _city;

  int get rooms => _rooms;

  List<RoomData> get hotelRooms => _hotelRooms;
  List<Room> get availableRooms => _availableRooms;
  List<RoomItem> get requestRooms => _requestRooms;
  List<Hotel> get hotels => _hotels;

  hotel_details.HotelDetailsResponse get hotelDetailsResponse =>
      _hotelDetailsResponse;

  SelectHotelResponse get selectHotelResponse => _selectHotelResponse;

  RoomFilterResponse get roomFilterResponse => _roomFilterResponse;

  // Loading

  bool isSearchCityLoading = false;

  bool isSearchHotelsLoading = false;

  bool isGettingHotelDetailsLoading = false;

  bool isAvailableRoomsLoading = false;

  bool isHotelAndRoomSelectionLoading = false;

  // Hotel Functions

  String getPassengerType(String type, int? age) {
    String result = '';
    switch (type) {
      case "Adult":
        result = "ADT";
        break;
      case "Child":
        if (age! > 1) {
          result = "CHD";
        } else {
          result = "INF";
        }

        break;
      default:
        result = "ADT";
    }
    return result;
  }

  handleCheckInDateChanging(DateTime checkIn) {
    _checkInDate = checkIn;
    emit(
      ChangeCheckInDate(
        checkInDate: _checkInDate,
      ),
    );
  }

  handleCheckOutDateChanging(DateTime checkOut) {
    _checkOutDate = checkOut;
    emit(
      ChangeCheckOutDate(
        checkOutDate: _checkOutDate,
      ),
    );
  }

  handleAdultsChanges(RoomData room, String operation) {
    if (operation == '+') {
      if (room.adults < 5) {
        room.adults++;
      }
    } else {
      if (room.adults > 1) {
        room.adults--;
      }
    }
    emit(ChangeAdults(room: room));
  }

  handleChildrenChanges(RoomData room, String operation) {
    if (operation == '+') {
      if (room.children < 5) {
        room.children++;
      }
    } else {
      if (room.children > 0) {
        room.children--;
      }
    }
    emit(ChangeChildren(room: room));
  }

  handleRoomsChanges(int r, String operation) {
    _rooms = r;
    if (operation == '+') {
      _rooms++;
      _hotelRooms.add(RoomData.emptyWithId(r - 1));

      // we are using this now !!
      _requestRooms.add(
        RoomItem(
          adults: 1,
          children: [],
        ),
      );
    } else {
      _rooms--;
      _hotelRooms.remove(hotelRooms.length - 1);
      // we are using this now !!
      _requestRooms.remove(
        _requestRooms[requestRooms.length - 1],
      );
    }
    emit(ChangeRooms(
      rooms: _rooms,
      requestRooms: _requestRooms,
    ));
  }

  /// for age
  handleHotelChildrenChanges(Child child, String operation) {
    if (operation == '+') {
      if (child.age < 11) {
        child.age++;
      }
    } else {
      if (child.age > 2) {
        child.age--;
      }
    }
    emit(ChangeHotelChildren(child: child));
  }

  handleHotelSelection(Country country) {
    _country = country;
    _city = City.empty();
    _cities = [];
    searchCityHandler();
    emit(
      HotelSelectionChanging(country: _country),
    );
  }

  handleHotelCitySelection(City c) {
    _city = c;
    emit(
      HotelCitySelectionChanging(city: _city),
    );
  }

  handleHotelRoomSelection(int r) {
    for (int i = _hotelRooms.length - 1; i < r; i++) {
      _hotelRooms.add(
        RoomData.emptyWithId(_hotelRooms.length + 1),
      );
      print('Item No' + i.toString() + 'Created');
      print('This is list' + _hotelRooms.length.toString());

      print(r);
    }
    emit(hotelRoomsState(hotelRooms: _hotelRooms));
  }

  handleHotelChildSelection(RoomData room, int c) {
    for (int i = room.childs.length - 2; i < c; i++) {
      room.childs!.add(
        Child.emptyWithId(room.childs.length + 1),
      );
      print(
        'Item No' + i.toString() + 'Created',
      );
      print(
        'This is list' + room.childs.length.toString(),
      );

      print(c);
    }
    emit(hotelChildrenState(hotelChildren: room.childs));
  }

  searchCountryHandler() async {
    try {
      isSearchDataLoading = true;

      final CountriesResponse response = await ApiServices(dio).getCountries(
        await AuthService().getOurAuth(),
        StringsManager.contentType,
        'v1',
        StringsManager.ourToken,
      );

      _countries = response.data!.countries![0];

      emit(LoadCountriesState(countries: _countries));
    } catch (e) {
      isSearchDataLoading = false;
      onError(e, StackTrace.current);
    } finally {
      isSearchDataLoading = false;
    }
  }

  searchCityHandler() async {
    try {
      isSearchCityLoading = true;

      final CitiesResponse response = await ApiServices(dio).getCities(
        country.code.toString(),
        await AuthService().getOurAuth(),
        StringsManager.contentType,
        'v1',
        StringsManager.ourToken,
        1,
        5000,
      );

      _cities = response.data!.cities!;

      emit(LoadCitiesState(cities: _cities));
    } catch (e) {
      isSearchCityLoading = false;
      onError(e, StackTrace.current);
      emit(NoHotelDataFoundState(error: e.toString()));
    } finally {
      isSearchCityLoading = false;
    }
  }

  // handleChildrenChanges
  childrenChangesHandler(int index, String operation) {
    if (operation == '+') {
      if (_requestRooms[index].children.length < 5) {
        _requestRooms[index].children.add(1);
      }
    } else {
      if (_requestRooms[index].children.isNotEmpty) {
        _requestRooms[index].children.remove(
              _requestRooms[index]
                  .children[_requestRooms[index].children.length - 1],
            );
      }
    }
    emit(
      RoomDataChangingState(
        requestRooms: _requestRooms,
      ),
    );
  }

  childrenAgeChangesHandler(int index, int childIndex, String operation) {
    if (operation == '+') {
      if (_requestRooms[index].children[childIndex] < 11) {
        _requestRooms[index].children[childIndex]++;
      }
    } else {
      if (_requestRooms[index].children[childIndex] > 1) {
        _requestRooms[index].children[childIndex]--;
      }
    }
    emit(RoomDataChangingState(requestRooms: _requestRooms));
  }

  adultsChangesHandler(int index, String operation) {
    if (operation == '+') {
      if (_requestRooms[index].adults < 5) {
        _requestRooms[index].adults++;
      }
    } else {
      if (_requestRooms[index].adults > 1) {
        _requestRooms[index].adults--;
      }
    }
    emit(RoomDataChangingState(requestRooms: _requestRooms));
  }

  searchHotelsHandler(
    String cityCode,
    //String Nationality,
  ) async {
    isSearchHotelsLoading = true;

    try {
      final HotelResponse response = await ApiServices(dio).getHotels(
        await AuthService().getOurAuth(),
        'v1',
        StringsManager.contentType,
        StringsManager.contentType,
        StringsManager.ourToken,
        {
          "cityId": cityCode.isEmpty ? "103078" : cityCode,
          "checkIn": checkInDate.toString().substring(0, 10), //"2024-09-05",
          "checkOut": checkOutDate.toString().substring(0, 10), //"2024-09-10",
          "rooms": _requestRooms,
          /* [
            {
              /* "roomType": "double", */
              "adults": 2,
              "children": ["8", "1"]
            }
          ], */
          "category": "0",
          "nationality": "DE",
          "searchTimeout": "60"
        },
      );

      if (response.error != null) {
        isSearchFlightLoading = false;
        print(response.error!.message.toString());
        emit(NoDataFoundState());
        return;
      }

      _hotels = response.data!.entities!;

      print(" Got ${_hotels.length} Hotels !!");

      print(_hotels);

      emit(LoadHotelsState(hotels: _hotels));
    } catch (e) {
      isSearchHotelsLoading = false;
      onError(e, StackTrace.current);
      emit(NoDataFoundState());
      //throw Exception(e.toString());
    } finally {
      isSearchHotelsLoading = false;
    }
  }

  selectHotelImageHandler(Image img) {
    selectedImage = img;
    emit(
      SelectingHotelImageState(
        img: selectedImage,
      ),
    );
  }

  getHotelDetails(String itemId) async {
    isGettingHotelDetailsLoading = true;

    final hotel_details.HotelDetailsResponse response =
        await ApiServices(dio).getHotelDetails(
      itemId,
      await SharedPreferencesUtil.getAuthToken("accessToken") ??
          await AuthService().getOurAuth(),
      StringsManager.contentType,
      'v1',
      StringsManager.ourToken,
    );

    _hotelDetailsResponse = response;

    emit(
      LoadHotelDetailsState(
        hotelDetailsResponse: _hotelDetailsResponse,
      ),
    );

    isGettingHotelDetailsLoading = false;

    //onError(e, StackTrace.current);
    //emit(NoHotelDetailsFoundState(error: e.toString()));
    isGettingHotelDetailsLoading = false;

    isGettingHotelDetailsLoading = false;
  }

  filterAvailableRooms(String itemId) async {
    isAvailableRoomsLoading = true;

    try {
      final RoomFilterResponse response =
          await ApiServices(dio).filterAvailableRooms(
        itemId,
        await SharedPreferencesUtil.getAuthToken("accessToken") ??
            await AuthService().getOurAuth(),
        StringsManager.contentType,
        'v1',
        StringsManager.ourToken,
      );

      _roomFilterResponse = response;

      _availableRooms = response.data!.entities!;

      emit(
        LoadAvailableRoomsState(
          availableRooms: _availableRooms,
          roomFilterResponse: _roomFilterResponse,
        ),
      );

      isAvailableRoomsLoading = false;
    } catch (e) {
      onError(e, StackTrace.current);
      //emit(NoHotelDataFoundState(error: e.toString()));
      isAvailableRoomsLoading = false;
    } finally {
      isAvailableRoomsLoading = false;
    }
  }

  selectHotelAndRoom(String itemId, int solutionId) async {
    isHotelAndRoomSelectionLoading = true;

    try {
      final SelectHotelResponse response =
          await ApiServices(dio).selectHotelAndRoom(
        itemId,
        solutionId,
        await SharedPreferencesUtil.getAuthToken("accessToken") ??
            await AuthService().getOurAuth(),
        StringsManager.contentType,
        'v1',
        StringsManager.ourToken,
      );

      _selectHotelResponse = response;

      emit(
        HotelAndRoomSelectionState(
          selectHotelResponse: _selectHotelResponse,
        ),
      );

      isHotelAndRoomSelectionLoading = false;
    } catch (e) {
      onError(e, StackTrace.current);
      emit(NoHotelDetailsFoundState(error: e.toString()));
      isHotelAndRoomSelectionLoading = false;
    } finally {
      isHotelAndRoomSelectionLoading = false;
    }
  }
}
