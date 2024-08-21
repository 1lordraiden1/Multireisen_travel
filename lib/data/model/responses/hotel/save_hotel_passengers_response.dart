// To parse this JSON data, do
//
//     final saveHotelPassengersResponse = saveHotelPassengersResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'save_hotel_passengers_response.g.dart';

SaveHotelPassengersResponse saveHotelPassengersResponseFromJson(String str) =>
    SaveHotelPassengersResponse.fromJson(json.decode(str));

String saveHotelPassengersResponseToJson(SaveHotelPassengersResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SaveHotelPassengersResponse {
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

  SaveHotelPassengersResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
    this.error,
  });

  factory SaveHotelPassengersResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveHotelPassengersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveHotelPassengersResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "bookingId")
  int? bookingId;
  @JsonKey(name: "refundable")
  bool? refundable;
  @JsonKey(name: "price")
  Price? price;
  @JsonKey(name: "messages")
  List<dynamic>? messages;

  Data({
    this.bookingId,
    this.refundable,
    this.price,
    this.messages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "netTotal")
  double? netTotal;
  @JsonKey(name: "tax")
  double? tax;
  @JsonKey(name: "margin")
  int? margin;
  @JsonKey(name: "discount")
  int? discount;
  @JsonKey(name: "optionalServices")
  int? optionalServices;
  @JsonKey(name: "paymentFee")
  int? paymentFee;
  @JsonKey(name: "total")
  double? total;

  Price({
    this.currency,
    this.netTotal,
    this.tax,
    this.margin,
    this.discount,
    this.optionalServices,
    this.paymentFee,
    this.total,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
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
