class EndPoints {
  static const baseUrl = 'http://api2-test.multireisen.com';
  static const oldUrl = 'https://travelapi.toortravel.com/public/api/';
  //'http://roadmap.technofutureegypt.com/api/';
  static const baseFileUrl = 'http://roadmap.technofutureegypt.com/';

  static const baseUrl1 = 'travelapi.toortravel.com';
  static const basePart = '/public/api/';
  static const getToken = "guest";

  /// Flight
  static const getAirports = 'air/airports/';
  static const searchAirports = 'air/search';
  static const searchDetails = 'air/search/detials';
  static const getTicketLCCTrue = 'air/ticket/lcc';
  static const bookingLCCFalse = 'air/booking';
  static const ticketLCCFalse = 'air/ticket/no-lcc';
  static const getBookingDetails = 'air/GetBookingDetails';

  /// Hotels
  static const getCountries = "hotel/";
  static const getCities = "hotel/city/";
  static const searchHotel = "/hotels/search";
  static const searchHotels = "/hotels/search";




  /// Test API
  //
  static const testURL = 'http://api2-test.multireisen.com';

  static const basicToken = 'Basic ZGV2Lm1yZEBxZmx5LmNvOkRldkA3OA==';

  static const testToken = '/gettoken';

  static const newFlightSearch = '/flights/search';

  static const filterFlightSearch = '/flights/items';

  static String selectFlight(String itemId) {
    return "/flights/items/${itemId}/select";
  }

  static String savePassengers(String itemId) {
    return "/flights/items/${itemId}/passengers";
  }

  static String finalizeBooking(String itemId) {
    return "/flights/items/${itemId}/select";
  }

  /* 
  static const loginUrl = 'User/Login';
  static const roadmapUrl = 'Course/GetRoadMap';
  static const stationUrl = 'User/StationData';
  static const trackUrl = 'Course/GetTrakeDataById';
  static const skillCoursesUrl = 'Course/GetCoursesBySkills';
  static const courseUrl = 'Course/GetCourseById';
  static const skillsUrl = 'User/GetUserStatistic';
  static const addStationUrl = 'User/UpdateChildCVData';
  static const addSchoolUrl = 'User/UpdateChildSchoolData';
  static const schoolDataUrl = 'User/GetChildSchoolData';
  static const personalDataUrl = 'User/GetChildPersonalData';
  static const addPersonalUrl = 'User/UpdateChildSchoolData';
  static const applyCourseUrl = 'Course/AssignaCourseToUser';
  static const userDataUrl = 'User/GetUserChildById';
  static const stationDataUrl = 'User/GetUserCvDataByStationType';
  static const messageUrl = 'Message/GetUserMessage';
  static const certificateUrl = '/Course/DownloadCertificate';
  static const downloadCvUrl = 'User/DownloadCV';
  static const updateImageUrl = 'User/UpdateChildImage'; */
}
