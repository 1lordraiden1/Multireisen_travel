// To parse this JSON data, do
//
//     final getTicketResponse = getTicketResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_ticket_response.g.dart';

GetTicketResponse getTicketResponseFromJson(String str) => GetTicketResponse.fromJson(json.decode(str));

String getTicketResponseToJson(GetTicketResponse data) => json.encode(data.toJson());

@JsonSerializable()
class GetTicketResponse {
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

    GetTicketResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory GetTicketResponse.fromJson(Map<String, dynamic> json) => _$GetTicketResponseFromJson(json);

    Map<String, dynamic> toJson() => _$GetTicketResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "class")
    String? dataClass;
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "segments")
    List<Segment>? segments;
    @JsonKey(name: "passengers")
    List<Passenger>? passengers;

    Data({
        this.dataClass,
        this.properties,
        this.segments,
        this.passengers,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Passenger {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "title")
    String? title;
    @JsonKey(name: "firstName")
    String? firstName;
    @JsonKey(name: "lastName")
    String? lastName;
    @JsonKey(name: "birthDate")
    DateTime? birthDate;
    @JsonKey(name: "nationality")
    String? nationality;
    @JsonKey(name: "passport")
    Passport? passport;
    @JsonKey(name: "services")
    List<Service>? services;

    Passenger({
        this.id,
        this.type,
        this.title,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.nationality,
        this.passport,
        this.services,
    });

    factory Passenger.fromJson(Map<String, dynamic> json) => _$PassengerFromJson(json);

    Map<String, dynamic> toJson() => _$PassengerToJson(this);
}

@JsonSerializable()
class Passport {
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "number")
    String? number;
    @JsonKey(name: "expiry")
    DateTime? expiry;
    @JsonKey(name: "issueCountry")
    String? issueCountry;

    Passport({
        this.type,
        this.number,
        this.expiry,
        this.issueCountry,
    });

    factory Passport.fromJson(Map<String, dynamic> json) => _$PassportFromJson(json);

    Map<String, dynamic> toJson() => _$PassportToJson(this);
}

@JsonSerializable()
class Service {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "type")
    int? type;

    Service({
        this.id,
        this.type,
    });

    factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

    Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class Properties {
    @JsonKey(name: "reservationCode")
    String? reservationCode;
    @JsonKey(name: "providerReservationCode")
    dynamic providerReservationCode;
    @JsonKey(name: "airlineReservationCode")
    String? airlineReservationCode;
    @JsonKey(name: "IATAnumber")
    dynamic iatAnumber;
    @JsonKey(name: "agencyCode")
    dynamic agencyCode;
    @JsonKey(name: "PCC")
    dynamic pcc;
    @JsonKey(name: "issued")
    DateTime? issued;

    Properties({
        this.reservationCode,
        this.providerReservationCode,
        this.airlineReservationCode,
        this.iatAnumber,
        this.agencyCode,
        this.pcc,
        this.issued,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Segment {
    @JsonKey(name: "group")
    int? group;
    @JsonKey(name: "class")
    Class? segmentClass;
    @JsonKey(name: "carrier")
    Carrier? carrier;
    @JsonKey(name: "operatingCarrier")
    Carrier? operatingCarrier;
    @JsonKey(name: "origin")
    Destination? origin;
    @JsonKey(name: "destination")
    Destination? destination;
    @JsonKey(name: "techStops")
    int? techStops;
    @JsonKey(name: "equipment")
    dynamic equipment;
    @JsonKey(name: "flightTime")
    int? flightTime;
    @JsonKey(name: "journeyTime")
    int? journeyTime;

    Segment({
        this.group,
        this.segmentClass,
        this.carrier,
        this.operatingCarrier,
        this.origin,
        this.destination,
        this.techStops,
        this.equipment,
        this.flightTime,
        this.journeyTime,
    });

    factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);

    Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

@JsonSerializable()
class Carrier {
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "flightNumber")
    String? flightNumber;

    Carrier({
        this.code,
        this.name,
        this.flightNumber,
    });

    factory Carrier.fromJson(Map<String, dynamic> json) => _$CarrierFromJson(json);

    Map<String, dynamic> toJson() => _$CarrierToJson(this);
}

@JsonSerializable()
class Destination {
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "date")
    DateTime? date;
    @JsonKey(name: "time")
    String? time;
    @JsonKey(name: "terminal")
    String? terminal;

    Destination({
        this.code,
        this.name,
        this.date,
        this.time,
        this.terminal,
    });

    factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);

    Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@JsonSerializable()
class Class {
    @JsonKey(name: "name")
    dynamic name;
    @JsonKey(name: "code")
    dynamic code;
    @JsonKey(name: "bookingCode")
    dynamic bookingCode;
    @JsonKey(name: "availableSeats")
    int? availableSeats;
    @JsonKey(name: "originalname")
    String? originalname;

    Class({
        this.name,
        this.code,
        this.bookingCode,
        this.availableSeats,
        this.originalname,
    });

    factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

    Map<String, dynamic> toJson() => _$ClassToJson(this);
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
