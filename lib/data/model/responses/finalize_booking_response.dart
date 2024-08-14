// To parse this JSON data, do
//
//     final finalizeBookingResponse = finalizeBookingResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'finalize_booking_response.g.dart';

FinalizeBookingResponse finalizeBookingResponseFromJson(String str) => FinalizeBookingResponse.fromJson(json.decode(str));

String finalizeBookingResponseToJson(FinalizeBookingResponse data) => json.encode(data.toJson());

@JsonSerializable()
class FinalizeBookingResponse {
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

    FinalizeBookingResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
    });

    factory FinalizeBookingResponse.fromJson(Map<String, dynamic> json) => _$FinalizeBookingResponseFromJson(json);

    Map<String, dynamic> toJson() => _$FinalizeBookingResponseToJson(this);
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

    factory PriceBreakDown.fromJson(Map<String, dynamic> json) => _$PriceBreakDownFromJson(json);

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

    factory TaxBreakDown.fromJson(Map<String, dynamic> json) => _$TaxBreakDownFromJson(json);

    Map<String, dynamic> toJson() => _$TaxBreakDownToJson(this);
}
