// To parse this JSON data, do
//
//     final selectFlightResponse = selectFlightResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'select_flight_response.g.dart';

SelectFlightResponse selectFlightResponseFromJson(String str) => SelectFlightResponse.fromJson(json.decode(str));

String selectFlightResponseToJson(SelectFlightResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SelectFlightResponse {
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

    SelectFlightResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
    });

    factory SelectFlightResponse.fromJson(Map<String, dynamic> json) => _$SelectFlightResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SelectFlightResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "hash")
    String? hash;
    @JsonKey(name: "price")
    Price? price;
    @JsonKey(name: "segments")
    List<Segment>? segments;
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "links")
    List<Link>? links;
    @JsonKey(name: "baggageAllowance")
    List<dynamic>? baggageAllowance;
    @JsonKey(name: "supplierInfo")
    List<SupplierInfo>? supplierInfo;
    @JsonKey(name: "optionalServices")
    List<OptionalService>? optionalServices;
    @JsonKey(name: "requiredFields")
    List<String>? requiredFields;
    @JsonKey(name: "payModes")
    List<PayMode>? payModes;

    Data({
        this.itemId,
        this.hash,
        this.price,
        this.segments,
        this.properties,
        this.links,
        this.baggageAllowance,
        this.supplierInfo,
        this.optionalServices,
        this.requiredFields,
        this.payModes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
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
class OptionalService {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "type")
    int? type;
    @JsonKey(name: "minValue")
    int? minValue;
    @JsonKey(name: "maxValue")
    int? maxValue;
    @JsonKey(name: "perPax")
    bool? perPax;
    @JsonKey(name: "options")
    List<Option>? options;

    OptionalService({
        this.id,
        this.type,
        this.minValue,
        this.maxValue,
        this.perPax,
        this.options,
    });

    factory OptionalService.fromJson(Map<String, dynamic> json) => _$OptionalServiceFromJson(json);

    Map<String, dynamic> toJson() => _$OptionalServiceToJson(this);
}

@JsonSerializable()
class Option {
    @JsonKey(name: "value")
    int? value;
    @JsonKey(name: "bags")
    String? bags;
    @JsonKey(name: "maxweight")
    String? maxweight;
    @JsonKey(name: "price")
    double? price;

    Option({
        this.value,
        this.bags,
        this.maxweight,
        this.price,
    });

    factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

    Map<String, dynamic> toJson() => _$OptionToJson(this);
}

@JsonSerializable()
class PayMode {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "price")
    int? price;
    @JsonKey(name: "currency")
    String? currency;

    PayMode({
        this.id,
        this.name,
        this.type,
        this.price,
        this.currency,
    });

    factory PayMode.fromJson(Map<String, dynamic> json) => _$PayModeFromJson(json);

    Map<String, dynamic> toJson() => _$PayModeToJson(this);
}

@JsonSerializable()
class Price {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    double? basePrice;
    @JsonKey(name: "tax")
    double? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "fees")
    double? fees;
    @JsonKey(name: "total")
    double? total;
    @JsonKey(name: "priceBreakDown")
    List<PriceBreakDown>? priceBreakDown;

    Price({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.fees,
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

@JsonSerializable()
class Properties {
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "lcc")
    bool? lcc;
    @JsonKey(name: "privateFare")
    bool? privateFare;
    @JsonKey(name: "refundable")
    bool? refundable;
    @JsonKey(name: "platingCarrier")
    String? platingCarrier;
    @JsonKey(name: "ticketingDeadline")
    DateTime? ticketingDeadline;

    Properties({
        this.type,
        this.lcc,
        this.privateFare,
        this.refundable,
        this.platingCarrier,
        this.ticketingDeadline,
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
