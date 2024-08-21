import 'package:dio/dio.dart';
import 'package:qfly/data/model/responses/check_booking_cancellation_response.dart';
import 'package:qfly/data/model/responses/finalize_booking_response.dart';

import 'package:qfly/data/model/responses/flight_response.dart';
import 'package:qfly/data/model/responses/get_booking_response.dart';
import 'package:qfly/data/model/responses/get_rules_response.dart';
import 'package:qfly/data/model/responses/get_ticket_response.dart';
import 'package:qfly/data/model/responses/hotel/cities_response.dart';
import 'package:qfly/data/model/responses/hotel/countries_response.dart';
import 'package:qfly/data/model/responses/hotel/hotel_details_response.dart';
import 'package:qfly/data/model/responses/hotel/hotel_response.dart';
import 'package:qfly/data/model/responses/hotel/room_filter_response.dart';
import 'package:qfly/data/model/responses/hotel/save_hotel_passengers_response.dart';
import 'package:qfly/data/model/responses/hotel/select_hotel_response.dart';
import 'package:qfly/data/model/responses/issue_ticket_response.dart';
import 'package:qfly/data/model/responses/save_passengers_response.dart';
import 'package:qfly/data/model/responses/select_flight_response.dart';
import 'package:qfly/data/model/responses/void_ticket_response.dart';
import 'package:qfly/data/network/constant/end_points.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: EndPoints.testURL)
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  /* @GET(EndPoints)
  Future<ApiResponse> getHotels(
    @Queries() Map<String, dynamic> queries,
    @Header("guest") String guest,
  ); */

  @GET(EndPoints.testToken)
  Future<FlightResponse> getToken(
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
  );

  // Hotels

  @GET("/staticdata/countries")
  Future<CountriesResponse> getCountries(
    @Header('AccessToken') String accessToken,
    @Header('Accept') String accept,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    //@Header('Content') String contentType,
  );

  @GET("/staticdata/cities/{countryCode}")
  Future<CitiesResponse> getCities(
    @Path('countryCode') String countryCode,
    @Header('AccessToken') String accessToken,
    @Header('Accept') String accept,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    //@Header('Content') String contentType,
    @Query('page') int page,
    @Query('items') int items,
  );

  @POST(EndPoints.searchHotels)
  Future<HotelResponse> getHotels(
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
    @Header('Authorization') String auth,
    @Body() Map<String, dynamic> body,
  );

  @GET("/hotels/items/{itemId}/details")
  Future<HotelDetailsResponse> getHotelDetails(
    @Path('itemId') String itemId,
    @Header('AccessToken') String accessToken,
    @Header('Accept') String accept,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    //@Header('Content') String contentType,
  );

  @GET("/hotels/items/{itemId}/rooms")
  Future<RoomFilterResponse> filterAvailableRooms(
    @Path('itemId') String itemId,
    @Header('AccessToken') String accessToken,
    @Header('Accept') String accept,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    //@Header('Content') String contentType,
  );

  @GET("/hotels/items/{itemId}/rooms/{solutionId}/select")
  Future<SelectHotelResponse> selectHotelAndRoom(
    @Path('itemId') String itemId,
    @Path('solutionId') int solutionId,
    @Header('AccessToken') String accessToken,
    @Header('Accept') String accept,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    //@Header('Content') String contentType,
  );

  @POST("/hotels/items/{itemId}/rooms/{solutionId}/passengers")
  Future<SaveHotelPassengersResponse> saveHotelPassengers(
    @Path('itemId') String itemId,
    @Path('solutionId') int solutionId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
    @Body() Map<String, dynamic> body,
  );

  @PUT("/hotels/items/{itemId}/rooms/{solutionId}/book/{bookingId}")
  Future<FinalizeBookingResponse> finalizeHotelBooking(
    @Path('itemId') String itemId,
    @Path('solutionId') int solutionId,
    @Path('bookingId') String bookingId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
  );

  

  // Flights

  @POST(EndPoints.newFlightSearch)
  Future<FlightResponse> getFlights(
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
    @Body() Map<String, dynamic> body,
  );

  @GET(EndPoints.filterFlightSearch)
  Future<FlightResponse> filterSearch(
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    //@Header('Content') String contentType,
    @Query('page') int page,
  );

  @GET("/flights/items/{itemId}/farerules")
  Future<GetRulesResponse> getRules(
    @Path('itemId') String itemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    //@Header('Content') String contentType,
  );

  @GET("/flights/items/{itemId}/select")
  Future<SelectFlightResponse> selectFlight(
    @Path('itemId') String itemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    //@Header('Content') String contentType,
  );

  @POST("/flights/items/{itemId}/passengers")
  Future<SavePassengersResponse> savePassengers(
    @Path('itemId') String itemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
    @Body() Map<String, dynamic> body,
  );

  @PUT("/flights/items/{itemId}/book/{bookingId}")
  Future<FinalizeBookingResponse> finalizeBooking(
    @Path('itemId') String itemId,
    @Path('bookingId') String bookingId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Authorization') String auth,
    @Header('Accept') String accept,
    @Header('Content') String contentType,
  );

  @PATCH("/bookings/{bookingId}/issue/{bookingItemId}")
  Future<IssueTicketResponse> issueTicket(
    @Path('bookingId') String bookingId,
    @Path('bookingItemId') String bookingItemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Authorization') String auth,

    //@Header('Content') String contentType,
  );

  @GET("/bookings/{bookingId}")
  Future<GetBookingResponse> getBookingDetails(
    @Path('bookingId') String bookingId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Authorization') String auth,

    //@Header('Content') String contentType,
  );

  @GET("/bookings/{bookingId}/voucher/{bookingItemId}")
  Future<GetTicketResponse> getTicket(
    @Path('bookingId') String bookingId,
    @Path('bookingItemId') String bookingItemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Authorization') String auth,

    //@Header('Content') String contentType,
  );

  @GET("/bookings/{bookingId}/cancelcheck/{bookingItemId}")
  Future<CheckBookingCancellationResponse> checkBookingCancellation(
    @Path('bookingId') String bookingId,
    @Path('bookingItemId') String bookingItemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Authorization') String auth,

    //@Header('Content') String contentType,
  );

  @DELETE("/bookings/{bookingId}/cancel/{bookingItemId}")
  Future<VoidTicketResponse> cancelBooking(
    @Path('bookingId') String bookingId,
    @Path('bookingItemId') String bookingItemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Authorization') String auth,

    //@Header('Content') String contentType,
  );

  @DELETE("/bookings/{bookingId}/void/{bookingItemId}")
  Future<VoidTicketResponse> voidTicket(
    @Path('bookingId') String bookingId,
    @Path('bookingItemId') String bookingItemId,
    @Header('AccessToken') String accessToken,
    @Header('Version') String version,
    @Header('Accept') String accept,
    @Header('Authorization') String auth,

    //@Header('Content') String contentType,
  );
  // Base URL for your API
  /*  static const String baseUrl =
      'https://api2-test.multireisen.com/'; // EndPoints.baseUrl;

  // GET request using Dio
  Future<Response> getDioRequest(String endpoint, String? accessToken) async {
    final response = await _dio.get(
    
      '$baseUrl$endpoint',
      queryParameters: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ZGV2Lm1yZEBxZmx5LmNvOkRldkA3OA==', //StringsManager.ourToken,
        if (accessToken != null) 'AccessToken': accessToken,
      },
    ); // Get here access token+
    return response;
  }

  Future<void> postData(String url, Map<String, dynamic> data) async {
    // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',

        //'Authorization': StringsManager.ourToken,
      }, // Set your desired headers
      body: json.encode(data), // Replace with your request body
    );

    if (response.statusCode == 200) {
      print('Request successful! Response: ${response.body}');
    } else {
      print('Request failed with status code ${response.statusCode}');
    }
  }

  // GET request using http

  Future<http.Response?> getHttpRequest(
      String endpoint, String? userToken, String? searchValue) async {
    print("$baseUrl$endpoint");
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint${{if (searchValue != null) searchValue}}'),
        headers: <String, String>{
          //'Authorization': 'Bearer ${StringsManager.ourToken}',//StringsManager.ourToken,
          if (userToken != null) 'AccessToken': userToken,
        },
      );

      if (response.statusCode == 200) {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return response;
      } else {
        debugPrint('Error Response Body: ${response.body}');
        print('Error Status Code: ${response.statusCode}');
        return response;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return null;
    }
  }

  /* Future<http.Response> getHttpRequest(
      String endpoint, String? userToken) async {
        print("$baseUrl$endpoint");
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        //'Content-Type': 'application/json',
        'Authorization': StringsManager.ourToken,
        if (userToken != null) 'AccessToken': userToken,
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode.toString());

      return response;
    } else {
      debugPrint(response.body);
      print(response.statusCode.toString());
      return response;
    }
  }
 */
  // POST request using Dio
  Future<Response> postDioRequest(String endpoint, dynamic data) async {
    final response = await _dio.post('$baseUrl$endpoint', data: data);
    return response;
  }

  // DELETE request using http
  Future<http.Response> deleteHttpRequest(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return response;
  } */
}
