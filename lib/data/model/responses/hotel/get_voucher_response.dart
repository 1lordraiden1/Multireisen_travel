// To parse this JSON data, do
//
//     final getVoucherResponse = getVoucherResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_voucher_response.g.dart';

GetVoucherResponse getVoucherResponseFromJson(String str) =>
    GetVoucherResponse.fromJson(json.decode(str));

String getVoucherResponseToJson(GetVoucherResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetVoucherResponse {
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
  @JsonKey(name: "error")
  Error? error;

  GetVoucherResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
    this.error,
  });

  factory GetVoucherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVoucherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVoucherResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "class")
  String? dataClass;
  @JsonKey(name: "properties")
  Properties? properties;
  @JsonKey(name: "remarks")
  List<String>? remarks;
  @JsonKey(name: "rooms")
  List<RoomReserved>? rooms;

  Data({
    this.dataClass,
    this.properties,
    this.remarks,
    this.rooms,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: "bookingNumber")
  String? bookingNumber;
  @JsonKey(name: "reference")
  dynamic reference;
  @JsonKey(name: "supplierReference")
  String? supplierReference;
  @JsonKey(name: "supplierName")
  String? supplierName;
  @JsonKey(name: "issued")
  DateTime? issued;
  @JsonKey(name: "checkIn")
  DateTime? checkIn;
  @JsonKey(name: "checkOut")
  DateTime? checkOut;
  @JsonKey(name: "nights")
  String? nights;
  @JsonKey(name: "hotelName")
  String? hotelName;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "meal")
  String? meal;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "adults")
  int? adults;
  @JsonKey(name: "children")
  int? children;
  @JsonKey(name: "incomingOffice")
  dynamic incomingOffice;
  @JsonKey(name: "agencyReferent")
  dynamic agencyReferent;
  @JsonKey(name: "office")
  Office? office;
  @JsonKey(name: "geocodes")
  Geocodes? geocodes;

  Properties({
    this.bookingNumber,
    this.reference,
    this.supplierReference,
    this.supplierName,
    this.issued,
    this.checkIn,
    this.checkOut,
    this.nights,
    this.hotelName,
    this.category,
    this.meal,
    this.address,
    this.phone,
    this.adults,
    this.children,
    this.incomingOffice,
    this.agencyReferent,
    this.office,
    this.geocodes,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Geocodes {
  @JsonKey(name: "latitude")
  String? latitude;
  @JsonKey(name: "longitude")
  String? longitude;

  Geocodes({
    this.latitude,
    this.longitude,
  });

  factory Geocodes.fromJson(Map<String, dynamic> json) =>
      _$GeocodesFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodesToJson(this);
}

@JsonSerializable()
class Office {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;

  Office({
    this.id,
    this.email,
    this.phone,
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}

@JsonSerializable()
class RoomReserved {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "passengers")
  List<Passenger>? passengers;

  RoomReserved({
    this.type,
    this.name,
    this.passengers,
  });

  factory RoomReserved.fromJson(Map<String, dynamic> json) => _$RoomReservedFromJson(json);

  Map<String, dynamic> toJson() => _$RoomReservedToJson(this);
}

@JsonSerializable()
class Passenger {
  @JsonKey(name: "id")
  dynamic id;
  @JsonKey(name: "type")
  dynamic type;
  @JsonKey(name: "title")
  dynamic title;
  @JsonKey(name: "firstName")
  dynamic firstName;
  @JsonKey(name: "lastName")
  dynamic lastName;
  @JsonKey(name: "birthDate")
  dynamic birthDate;
  @JsonKey(name: "nationality")
  dynamic nationality;

  Passenger({
    this.id,
    this.type,
    this.title,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.nationality,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}

@JsonSerializable()
class Error {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "message")
  String? message;

  Error({
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
