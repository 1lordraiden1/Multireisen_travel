import 'package:html/parser.dart' as html_parser;

class Utility {
  Utility._();
  static Duration parseDuration(String s) {
    List<String> parts = s.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    //int seconds = int.parse(parts[2]);
    return Duration(
      hours: hours,
      minutes: minutes, /* seconds: seconds */
    );
  }

  static int convertDurationToSeconds(String duration) {
    List<String> parts = duration.split(':');
    if (parts.length != 3) {
      throw FormatException("Invalid duration format");
    }
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2]);
    return hours * 3600 + minutes * 60 + seconds;
  }

  static String convertMinutesToTime(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    return '${hours.toString().padLeft(2, '0')}:${remainingMinutes.toString().padLeft(2, '0')}';
  }

  static Duration? tryConvertFlexibleDurationToSeconds(String duration) {
    try {
      List<String> parts = duration.split(':');
      int hours = 0;
      int minutes = 0;
      int seconds = 0;

      if (parts.length == 3) {
        hours = int.parse(parts[0]);
        minutes = int.parse(parts[1]);
        seconds = int.parse(parts[2]);
      } else if (parts.length == 2) {
        minutes = int.parse(parts[0]);
        seconds = int.parse(parts[1]);
      } else if (parts.length == 1) {
        seconds = int.parse(parts[0]);
      } else {
        return null;
      }

      return Duration(seconds: hours * 3600 + minutes * 60 + seconds);
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic> convertJsonToQueryParams(
      Map<String, dynamic> jsonData) {
    // If children_ages is a list in string format, convert it to a list

    if (jsonData.containsKey('adults')) {
      jsonData['adults'] =
          jsonData['adults'].replaceAll('[', '').replaceAll(']', '').split(',');
    }

    if (jsonData.containsKey('children')) {
      jsonData['children'] = jsonData['children']
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',');
    }

    if (jsonData.containsKey('children_ages')) {
      jsonData['children_ages'] = jsonData['children_ages']
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(', ');
    }

    return jsonData;
  }

  static String parseHtmlString(String htmlString) {
    var document = html_parser.parse(htmlString);
    String parsedString =
        html_parser.parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
