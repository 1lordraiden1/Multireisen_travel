// To parse this JSON data, do
//
//     final issueTicketResponse = issueTicketResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'issue_ticket_response.g.dart';

IssueTicketResponse issueTicketResponseFromJson(String str) => IssueTicketResponse.fromJson(json.decode(str));

String issueTicketResponseToJson(IssueTicketResponse data) => json.encode(data.toJson());

@JsonSerializable()
class IssueTicketResponse {
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

    IssueTicketResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory IssueTicketResponse.fromJson(Map<String, dynamic> json) => _$IssueTicketResponseFromJson(json);

    Map<String, dynamic> toJson() => _$IssueTicketResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "success")
    bool? success;
    @JsonKey(name: "messages")
    List<Message>? messages;

    Data({
        this.properties,
        this.success,
        this.messages,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Message {
    @JsonKey(name: "text")
    String? text;
    @JsonKey(name: "type")
    int? type;

    Message({
        this.text,
        this.type,
    });

    factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

    Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Properties {
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "bookingId")
    String? bookingId;
    @JsonKey(name: "bookingItemId")
    String? bookingItemId;
    @JsonKey(name: "bookingNumber")
    String? bookingNumber;
    @JsonKey(name: "number")
    String? number;
    @JsonKey(name: "status")
    Status? status;

    Properties({
        this.type,
        this.bookingId,
        this.bookingItemId,
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
