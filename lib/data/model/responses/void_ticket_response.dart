// To parse this JSON data, do
//
//     final voidTicketResponse = voidTicketResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'void_ticket_response.g.dart';

VoidTicketResponse voidTicketResponseFromJson(String str) => VoidTicketResponse.fromJson(json.decode(str));

String voidTicketResponseToJson(VoidTicketResponse data) => json.encode(data.toJson());

@JsonSerializable()
class VoidTicketResponse {
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

    VoidTicketResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory VoidTicketResponse.fromJson(Map<String, dynamic> json) => _$VoidTicketResponseFromJson(json);

    Map<String, dynamic> toJson() => _$VoidTicketResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "success")
    bool? success;

    Data({
        this.properties,
        this.success,
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
    @JsonKey(name: "status")
    Status? status;

    Properties({
        this.bookingId,
        this.bookingItemId,
        this.type,
        this.bookingNumber,
        this.number,
        this.status,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesToJson(this);
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
