// To parse this JSON data, do
//
//     final airportsResponse = airportsResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'airports_response.g.dart';

AirportsResponse airportsResponseFromJson(String str) =>
    AirportsResponse.fromJson(json.decode(str));

String airportsResponseToJson(AirportsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AirportsResponse {
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

  AirportsResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
  });

  factory AirportsResponse.fromJson(Map<String, dynamic> json) =>
      _$AirportsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AirportsResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "airports")
  List<List<Airport>>? airports;

  Data({
    this.airports,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Airport {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "iata")
  String? iata;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "state")
  String? state;

  Airport({
    this.code,
    this.iata,
    this.name,
    this.country,
    this.state,
  });

  factory Airport.empty() => Airport(
        iata: '',
        name: '',
        code: '',
        country: '',
        state: '',
      );

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);

  Map<String, dynamic> toJson() => _$AirportToJson(this);
}
