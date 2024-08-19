// To parse this JSON data, do
//
//     final countriesResponse = countriesResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'countries_response.g.dart';

CountriesResponse countriesResponseFromJson(String str) =>
    CountriesResponse.fromJson(json.decode(str));

String countriesResponseToJson(CountriesResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CountriesResponse {
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

  CountriesResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
  });

  factory CountriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "countries")
  List<List<Country>>? countries;

  Data({
    this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;

  Country({
    this.code,
    this.name,
  });

  factory Country.empty() {
    return Country(
      code: '',
      name: '',
    );
  }

  Map<String, dynamic> toFlightJson() {
    return {
      'CountryCode': code,
      'CountryName': name,
    };
  }

  factory Country.fromFlightJson(Map<String, dynamic> json) {
    return Country(
      code: json['CountryCode'],
      name: json['CountryName'],
    );
  }

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
