// To parse this JSON data, do
//
//     final flight = flightFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'flight.g.dart';

Flight flightFromJson(String str) => Flight.fromJson(json.decode(str));

String flightToJson(Flight data) => json.encode(data.toJson());

@JsonSerializable()
class Flight {
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

    Flight({
        this.itemId,
        this.hash,
        this.price,
        this.segments,
        this.properties,
        this.links,
        this.baggageAllowance,
    });

    factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);

    Map<String, dynamic> toJson() => _$FlightToJson(this);
}

@JsonSerializable()
class Link {
    @JsonKey(name: "rel")
    String? rel;
    @JsonKey(name: "href")
    String? href;

    Link({
        this.rel,
        this.href,
    });

    factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

    Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class Price {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    int? basePrice;
    @JsonKey(name: "tax")
    double? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "fees")
    int? fees;
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
    int? basePrice;
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
    String? value;

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
    @JsonKey(name: "baggageAllowance")
    BaggageAllowance? baggageAllowance;
    @JsonKey(name: "techStops")
    int? techStops;
    @JsonKey(name: "equipment")
    dynamic equipment;
    @JsonKey(name: "flightTime")
    int? flightTime;
    @JsonKey(name: "journeyTime")
    int? journeyTime;
    @JsonKey(name: "waitTime")
    int? waitTime;

    Segment({
        this.group,
        this.segmentClass,
        this.carrier,
        this.operatingCarrier,
        this.origin,
        this.destination,
        this.baggageAllowance,
        this.techStops,
        this.equipment,
        this.flightTime,
        this.journeyTime,
        this.waitTime,
    });

    factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);

    Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

@JsonSerializable()
class BaggageAllowance {
    @JsonKey(name: "amount")
    int? amount;
    @JsonKey(name: "unit")
    int? unit;
    @JsonKey(name: "unitName")
    String? unitName;

    BaggageAllowance({
        this.amount,
        this.unit,
        this.unitName,
    });

    factory BaggageAllowance.fromJson(Map<String, dynamic> json) => _$BaggageAllowanceFromJson(json);

    Map<String, dynamic> toJson() => _$BaggageAllowanceToJson(this);
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
    dynamic terminal;

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
    String? name;
    @JsonKey(name: "code")
    String? code;
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
