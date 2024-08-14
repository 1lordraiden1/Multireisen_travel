// To parse this JSON data, do
//
//     final savePassengersResponse = savePassengersResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'save_passengers_response.g.dart';

SavePassengersResponse savePassengersResponseFromJson(String str) =>
    SavePassengersResponse.fromJson(json.decode(str));

String savePassengersResponseToJson(SavePassengersResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SavePassengersResponse {
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

  SavePassengersResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
  });

  factory SavePassengersResponse.fromJson(Map<String, dynamic> json) =>
      _$SavePassengersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SavePassengersResponseToJson(this);
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
  @JsonKey(name: "priceBreakDown")
  List<PriceBreakDown>? priceBreakDown;

  Price({
    this.currency,
    this.netTotal,
    this.tax,
    this.margin,
    this.discount,
    this.optionalServices,
    this.paymentFee,
    this.total,
    this.priceBreakDown,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class PriceBreakDown {
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "PTC")
  String? ptc;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "basePrice")
  double? basePrice;
  @JsonKey(name: "tax")
  double? tax;
  @JsonKey(name: "margin")
  int? margin;
  @JsonKey(name: "total")
  double? total;
  @JsonKey(name: "taxBreakDown")
  List<TaxBreakDown>? taxBreakDown;

  PriceBreakDown({
    this.currency,
    this.ptc,
    this.count,
    this.basePrice,
    this.tax,
    this.margin,
    this.total,
    this.taxBreakDown,
  });

  factory PriceBreakDown.fromJson(Map<String, dynamic> json) =>
      _$PriceBreakDownFromJson(json);

  Map<String, dynamic> toJson() => _$PriceBreakDownToJson(this);
}

@JsonSerializable()
class TaxBreakDown {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "value")
  double? value;

  TaxBreakDown({
    this.id,
    this.value,
  });

  factory TaxBreakDown.fromJson(Map<String, dynamic> json) =>
      _$TaxBreakDownFromJson(json);

  Map<String, dynamic> toJson() => _$TaxBreakDownToJson(this);
}
