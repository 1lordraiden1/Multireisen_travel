// To parse this JSON data, do
//
//     final finalizeHotelBookingResponse = finalizeHotelBookingResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'finalize_hotel_booking_response.g.dart';

FinalizeHotelBookingResponse finalizeHotelBookingResponseFromJson(String str) => FinalizeHotelBookingResponse.fromJson(json.decode(str));

String finalizeHotelBookingResponseToJson(FinalizeHotelBookingResponse data) => json.encode(data.toJson());

@JsonSerializable()
class FinalizeHotelBookingResponse {
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

    FinalizeHotelBookingResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory FinalizeHotelBookingResponse.fromJson(Map<String, dynamic> json) => _$FinalizeHotelBookingResponseFromJson(json);

    Map<String, dynamic> toJson() => _$FinalizeHotelBookingResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "bookingId")
    int? bookingId;
    @JsonKey(name: "refundable")
    bool? refundable;
    @JsonKey(name: "price")
    Price? price;
    @JsonKey(name: "bookings")
    List<Booking>? bookings;

    Data({
        this.bookingId,
        this.refundable,
        this.price,
        this.bookings,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Booking {
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "bookingItemId")
    int? bookingItemId;
    @JsonKey(name: "bookingNumber")
    String? bookingNumber;
    @JsonKey(name: "bookingCode")
    String? bookingCode;
    @JsonKey(name: "itemId")
    int? itemId;
    @JsonKey(name: "number")
    String? number;
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "status")
    Status? status;

    Booking({
        this.type,
        this.bookingItemId,
        this.bookingNumber,
        this.bookingCode,
        this.itemId,
        this.number,
        this.code,
        this.status,
    });

    factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

    Map<String, dynamic> toJson() => _$BookingToJson(this);
}

@JsonSerializable()
class Status {
    @JsonKey(name: "booking")
    String? booking;
    @JsonKey(name: "document")
    String? document;

    Status({
        this.booking,
        this.document,
    });

    factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

    Map<String, dynamic> toJson() => _$StatusToJson(this);
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
