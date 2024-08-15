// To parse this JSON data, do
//
//     final checkBookingCancellationResponse = checkBookingCancellationResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'check_booking_cancellation_response.g.dart';

CheckBookingCancellationResponse checkBookingCancellationResponseFromJson(String str) => CheckBookingCancellationResponse.fromJson(json.decode(str));

String checkBookingCancellationResponseToJson(CheckBookingCancellationResponse data) => json.encode(data.toJson());

@JsonSerializable()
class CheckBookingCancellationResponse {
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

    CheckBookingCancellationResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory CheckBookingCancellationResponse.fromJson(Map<String, dynamic> json) => _$CheckBookingCancellationResponseFromJson(json);

    Map<String, dynamic> toJson() => _$CheckBookingCancellationResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "properties")
    Properties? properties;

    Data({
        this.properties,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Properties {
    @JsonKey(name: "bookingId")
    String? bookingId;
    @JsonKey(name: "bookingItemId")
    String? bookingItemId;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "bookingNumber")
    String? bookingNumber;
    @JsonKey(name: "number")
    String? number;
    @JsonKey(name: "deadline")
    dynamic deadline;
    @JsonKey(name: "status")
    Status? status;
    @JsonKey(name: "cancellable")
    bool? cancellable;
    @JsonKey(name: "fee")
    Fee? fee;
    @JsonKey(name: "conditions")
    List<dynamic>? conditions;

    Properties({
        this.bookingId,
        this.bookingItemId,
        this.type,
        this.bookingNumber,
        this.number,
        this.deadline,
        this.status,
        this.cancellable,
        this.fee,
        this.conditions,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Fee {
    @JsonKey(name: "amount")
    int? amount;
    @JsonKey(name: "currency")
    dynamic currency;

    Fee({
        this.amount,
        this.currency,
    });

    factory Fee.fromJson(Map<String, dynamic> json) => _$FeeFromJson(json);

    Map<String, dynamic> toJson() => _$FeeToJson(this);
}

@JsonSerializable()
class Status {
    @JsonKey(name: "booking")
    dynamic booking;
    @JsonKey(name: "document")
    dynamic document;

    Status({
        this.booking,
        this.document,
    });

    factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

    Map<String, dynamic> toJson() => _$StatusToJson(this);
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
