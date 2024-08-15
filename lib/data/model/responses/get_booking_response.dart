// To parse this JSON data, do
//
//     final getBookingResponse = getBookingResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_booking_response.g.dart';

GetBookingResponse getBookingResponseFromJson(String str) => GetBookingResponse.fromJson(json.decode(str));

String getBookingResponseToJson(GetBookingResponse data) => json.encode(data.toJson());

@JsonSerializable()
class GetBookingResponse {
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

    GetBookingResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory GetBookingResponse.fromJson(Map<String, dynamic> json) => _$GetBookingResponseFromJson(json);

    Map<String, dynamic> toJson() => _$GetBookingResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "properties")
    DataProperties? properties;
    @JsonKey(name: "entities")
    List<Entity>? entities;

    Data({
        this.properties,
        this.entities,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Entity {
    @JsonKey(name: "properties")
    EntityProperties? properties;
    @JsonKey(name: "segments")
    List<Segment>? segments;
    @JsonKey(name: "rules")
    List<dynamic>? rules;
    @JsonKey(name: "baggageAllowance")
    List<dynamic>? baggageAllowance;
    @JsonKey(name: "supplierInfo")
    List<SupplierInfo>? supplierInfo;
    @JsonKey(name: "links")
    List<Link>? links;

    Entity({
        this.properties,
        this.segments,
        this.rules,
        this.baggageAllowance,
        this.supplierInfo,
        this.links,
    });

    factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

    Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class Link {
    @JsonKey(name: "rel")
    String? rel;
    @JsonKey(name: "method")
    String? method;
    @JsonKey(name: "href")
    String? href;

    Link({
        this.rel,
        this.method,
        this.href,
    });

    factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

    Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class EntityProperties {
    @JsonKey(name: "bookingItemId")
    String? bookingItemId;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "bookingNumber")
    String? bookingNumber;
    @JsonKey(name: "number")
    String? number;
    @JsonKey(name: "lcc")
    bool? lcc;
    @JsonKey(name: "refundable")
    bool? refundable;
    @JsonKey(name: "platingCarrier")
    String? platingCarrier;
    @JsonKey(name: "deadline")
    DateTime? deadline;
    @JsonKey(name: "price")
    PurplePrice? price;
    @JsonKey(name: "status")
    Status? status;

    EntityProperties({
        this.bookingItemId,
        this.type,
        this.bookingNumber,
        this.number,
        this.lcc,
        this.refundable,
        this.platingCarrier,
        this.deadline,
        this.price,
        this.status,
    });

    factory EntityProperties.fromJson(Map<String, dynamic> json) => _$EntityPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$EntityPropertiesToJson(this);
}

@JsonSerializable()
class PurplePrice {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    double? basePrice;
    @JsonKey(name: "tax")
    double? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "discount")
    int? discount;
    @JsonKey(name: "optionalServices")
    int? optionalServices;
    @JsonKey(name: "fees")
    double? fees;
    @JsonKey(name: "total")
    double? total;
    @JsonKey(name: "priceBreakDown")
    List<PriceBreakDown>? priceBreakDown;

    PurplePrice({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.discount,
        this.optionalServices,
        this.fees,
        this.total,
        this.priceBreakDown,
    });

    factory PurplePrice.fromJson(Map<String, dynamic> json) => _$PurplePriceFromJson(json);

    Map<String, dynamic> toJson() => _$PurplePriceToJson(this);
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
class SupplierInfo {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "value")
    String? value;

    SupplierInfo({
        this.name,
        this.value,
    });

    factory SupplierInfo.fromJson(Map<String, dynamic> json) => _$SupplierInfoFromJson(json);

    Map<String, dynamic> toJson() => _$SupplierInfoToJson(this);
}

@JsonSerializable()
class DataProperties {
    @JsonKey(name: "bookingId")
    String? bookingId;
    @JsonKey(name: "created")
    DateTime? created;
    @JsonKey(name: "price")
    FluffyPrice? price;
    @JsonKey(name: "passengers")
    List<Passenger>? passengers;

    DataProperties({
        this.bookingId,
        this.created,
        this.price,
        this.passengers,
    });

    factory DataProperties.fromJson(Map<String, dynamic> json) => _$DataPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$DataPropertiesToJson(this);
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
    @JsonKey(name: "options")
    List<Option>? options;

    Passenger({
        this.id,
        this.type,
        this.title,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.nationality,
        this.passport,
        this.options,
    });

    factory Passenger.fromJson(Map<String, dynamic> json) => _$PassengerFromJson(json);

    Map<String, dynamic> toJson() => _$PassengerToJson(this);
}

@JsonSerializable()
class Option {
    @JsonKey(name: "value")
    int? value;
    @JsonKey(name: "bags")
    String? bags;
    @JsonKey(name: "maxweight")
    String? maxweight;
    @JsonKey(name: "id")
    String? id;

    Option({
        this.value,
        this.bags,
        this.maxweight,
        this.id,
    });

    factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

    Map<String, dynamic> toJson() => _$OptionToJson(this);
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
class FluffyPrice {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "net")
    String? net;
    @JsonKey(name: "margin")
    String? margin;
    @JsonKey(name: "discount")
    String? discount;
    @JsonKey(name: "paymentFee")
    String? paymentFee;
    @JsonKey(name: "total")
    String? total;

    FluffyPrice({
        this.currency,
        this.net,
        this.margin,
        this.discount,
        this.paymentFee,
        this.total,
    });

    factory FluffyPrice.fromJson(Map<String, dynamic> json) => _$FluffyPriceFromJson(json);

    Map<String, dynamic> toJson() => _$FluffyPriceToJson(this);
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
