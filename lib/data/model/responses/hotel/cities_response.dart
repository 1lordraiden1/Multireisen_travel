// To parse this JSON data, do
//
//     final citiesResponse = citiesResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'cities_response.g.dart';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

@JsonSerializable()
class CitiesResponse {
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "version")
  String? version;
  @JsonKey(name: "serverDate")
  DateTime? serverDate;
  @JsonKey(name: "server")
  String? server;
  @JsonKey(name: "data")
  Data? data;

  CitiesResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
  });

  factory CitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "properties")
  Properties? properties;
  @JsonKey(name: "cities")
  List<City>? cities;

  Data({
    this.properties,
    this.cities,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class City {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "country")
  Country? country;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "geocode")
  Geocode? geocode;

  City({
    this.code,
    this.name,
    this.country,
    this.state,
    this.geocode,
  });

  factory City.empty() {
    return City(
      code: '',
      name: '',
    );
  }

  factory City.fromFlightJson(Map<String, dynamic> json) {
    return City(
      code: json['CountryCode'],
      name: json['CountryName'],
    );
  }

  Map<String, dynamic> toFlightJson() {
    return {
      'CountryCode': code,
      'CountryName': name,
    };
  }

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

enum Country {
  @JsonValue("DE")
  DE
}

final countryValues = EnumValues({"DE": Country.DE});

@JsonSerializable()
class Geocode {
  @JsonKey(name: "latitude")
  String? latitude;
  @JsonKey(name: "longitude")
  String? longitude;

  Geocode({
    this.latitude,
    this.longitude,
  });

  factory Geocode.fromJson(Map<String, dynamic> json) =>
      _$GeocodeFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodeToJson(this);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: "totalcount")
  int? totalcount;
  @JsonKey(name: "displaycount")
  int? displaycount;
  @JsonKey(name: "pages")
  int? pages;
  @JsonKey(name: "page")
  int? page;

  Properties({
    this.totalcount,
    this.displaycount,
    this.pages,
    this.page,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
