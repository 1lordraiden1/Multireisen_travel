// To parse this JSON data, do
//
//     final roomFilterResponse = roomFilterResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:qfly/data/model/hotel/hotel.dart';

part 'room_filter_response.g.dart';

RoomFilterResponse roomFilterResponseFromJson(String str) => RoomFilterResponse.fromJson(json.decode(str));

String roomFilterResponseToJson(RoomFilterResponse data) => json.encode(data.toJson());

@JsonSerializable()
class RoomFilterResponse {
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

    RoomFilterResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory RoomFilterResponse.fromJson(Map<String, dynamic> json) => _$RoomFilterResponseFromJson(json);

    Map<String, dynamic> toJson() => _$RoomFilterResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "class")
    String? dataClass;
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "status")
    Status? status;
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "filters")
    Filters? filters;
    @JsonKey(name: "entities")
    List<Room>? entities;
    @JsonKey(name: "links")
    List<Link>? links;

    Data({
        this.dataClass,
        this.type,
        this.status,
        this.properties,
        this.filters,
        this.entities,
        this.links,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Entity {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "solutionId")
    int? solutionId;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "meal")
    EntityMeal? meal;
    @JsonKey(name: "roomtype")
    EntityMeal? roomtype;
    @JsonKey(name: "view")
    View? view;
    @JsonKey(name: "cxlPolicy")
    CxlPolicy? cxlPolicy;
    @JsonKey(name: "price")
    EntityPrice? price;
    @JsonKey(name: "additionalFees")
    List<dynamic>? additionalFees;
    @JsonKey(name: "priceInfo")
    String? priceInfo;
    @JsonKey(name: "sharingBedding")
    bool? sharingBedding;
    @JsonKey(name: "remarks")
    List<String>? remarks;
    @JsonKey(name: "links")
    List<Link>? links;

    Entity({
        this.itemId,
        this.solutionId,
        this.name,
        this.meal,
        this.roomtype,
        this.view,
        this.cxlPolicy,
        this.price,
        this.additionalFees,
        this.priceInfo,
        this.sharingBedding,
        this.remarks,
        this.links,
    });

    factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

    Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class CxlPolicy {
    @JsonKey(name: "deadline")
    DateTime? deadline;
    @JsonKey(name: "nonRefundable")
    bool? nonRefundable;
    @JsonKey(name: "info")
    String? info;
    @JsonKey(name: "conditions")
    List<dynamic>? conditions;

    CxlPolicy({
        this.deadline,
        this.nonRefundable,
        this.info,
        this.conditions,
    });

    factory CxlPolicy.fromJson(Map<String, dynamic> json) => _$CxlPolicyFromJson(json);

    Map<String, dynamic> toJson() => _$CxlPolicyToJson(this);
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
class EntityMeal {
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "name")
    String? name;

    EntityMeal({
        this.code,
        this.name,
    });

    factory EntityMeal.fromJson(Map<String, dynamic> json) => _$EntityMealFromJson(json);

    Map<String, dynamic> toJson() => _$EntityMealToJson(this);
}

@JsonSerializable()
class EntityPrice {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    double? basePrice;
    @JsonKey(name: "tax")
    double? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "fees")
    int? fees;
    @JsonKey(name: "total")
    double? total;

    EntityPrice({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.fees,
        this.total,
    });

    factory EntityPrice.fromJson(Map<String, dynamic> json) => _$EntityPriceFromJson(json);

    Map<String, dynamic> toJson() => _$EntityPriceToJson(this);
}

@JsonSerializable()
class View {
    @JsonKey(name: "code")
    int? code;
    @JsonKey(name: "name")
    String? name;

    View({
        this.code,
        this.name,
    });

    factory View.fromJson(Map<String, dynamic> json) => _$ViewFromJson(json);

    Map<String, dynamic> toJson() => _$ViewToJson(this);
}

@JsonSerializable()
class Filters {
    @JsonKey(name: "price")
    FiltersPrice? price;
    @JsonKey(name: "roomtypes")
    List<MealElement>? roomtypes;
    @JsonKey(name: "meals")
    List<MealElement>? meals;
    @JsonKey(name: "views")
    List<MealElement>? views;

    Filters({
        this.price,
        this.roomtypes,
        this.meals,
        this.views,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class MealElement {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "value")
    String? value;

    MealElement({
        this.id,
        this.value,
    });

    factory MealElement.fromJson(Map<String, dynamic> json) => _$MealElementFromJson(json);

    Map<String, dynamic> toJson() => _$MealElementToJson(this);
}

@JsonSerializable()
class FiltersPrice {
    @JsonKey(name: "min")
    int? min;
    @JsonKey(name: "max")
    int? max;
    @JsonKey(name: "currency")
    String? currency;

    FiltersPrice({
        this.min,
        this.max,
        this.currency,
    });

    factory FiltersPrice.fromJson(Map<String, dynamic> json) => _$FiltersPriceFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersPriceToJson(this);
}

@JsonSerializable()
class Properties {
    @JsonKey(name: "totalcount")
    int? totalcount;
    @JsonKey(name: "filteredcount")
    int? filteredcount;

    Properties({
        this.totalcount,
        this.filteredcount,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Status {
    @JsonKey(name: "percent")
    int? percent;
    @JsonKey(name: "finished")
    bool? finished;

    Status({
        this.percent,
        this.finished,
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
