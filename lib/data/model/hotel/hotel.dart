// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'hotel.g.dart';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));

String hotelToJson(Hotel data) => json.encode(data.toJson());

@JsonSerializable()
class Hotel {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "rooms")
    List<Room>? rooms;
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "links")
    List<Link>? links;

    Hotel({
        this.itemId,
        this.rooms,
        this.properties,
        this.links,
    });

    factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

    Map<String, dynamic> toJson() => _$HotelToJson(this);
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
class Properties {
    @JsonKey(name: "hotelId")
    String? hotelId;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "address")
    String? address;
    @JsonKey(name: "phone")
    String? phone;
    @JsonKey(name: "category")
    Category? category;
    @JsonKey(name: "location")
    Location? location;
    @JsonKey(name: "images")
    List<Image>? images;
    @JsonKey(name: "information")
    List<dynamic>? information;

    Properties({
        this.hotelId,
        this.name,
        this.address,
        this.phone,
        this.category,
        this.location,
        this.images,
        this.information,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Category {
    @JsonKey(name: "numeric")
    int? numeric;
    @JsonKey(name: "textual")
    dynamic textual;

    Category({
        this.numeric,
        this.textual,
    });

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Image {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "width")
    dynamic width;
    @JsonKey(name: "height")
    dynamic height;
    @JsonKey(name: "caption")
    String? caption;
    @JsonKey(name: "thumbnail")
    bool? thumbnail;
    @JsonKey(name: "url")
    String? url;

    Image({
        this.id,
        this.width,
        this.height,
        this.caption,
        this.thumbnail,
        this.url,
    });

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

    Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class Location {
    @JsonKey(name: "cityName")
    String? cityName;
    @JsonKey(name: "code")
    dynamic code;
    @JsonKey(name: "name")
    dynamic name;
    @JsonKey(name: "geoCodes")
    GeoCodes? geoCodes;

    Location({
        this.cityName,
        this.code,
        this.name,
        this.geoCodes,
    });

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

    Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class GeoCodes {
    @JsonKey(name: "latitude")
    String? latitude;
    @JsonKey(name: "longitude")
    String? longitude;

    GeoCodes({
        this.latitude,
        this.longitude,
    });

    factory GeoCodes.fromJson(Map<String, dynamic> json) => _$GeoCodesFromJson(json);

    Map<String, dynamic> toJson() => _$GeoCodesToJson(this);
}

@JsonSerializable()
class Room {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "solutionId")
    int? solutionId;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "meal")
    Meal? meal;
    @JsonKey(name: "roomtype")
    Meal? roomtype;
    @JsonKey(name: "view")
    View? view;
    @JsonKey(name: "cxlPolicy")
    CxlPolicy? cxlPolicy;
    @JsonKey(name: "price")
    Price? price;
    @JsonKey(name: "additionalFees")
    List<dynamic>? additionalFees;
    @JsonKey(name: "priceInfo")
    String? priceInfo;
    @JsonKey(name: "sharingBedding")
    bool? sharingBedding;
    @JsonKey(name: "remarks")
    List<dynamic>? remarks;
    @JsonKey(name: "links")
    List<Link>? links;
    @JsonKey(name: "originalItemId")
    String? originalItemId;
    @JsonKey(name: "originalSolutionId")
    int? originalSolutionId;

    Room({
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
        this.originalItemId,
        this.originalSolutionId,
    });

    factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

    Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class CxlPolicy {
    @JsonKey(name: "deadline")
    DateTime? deadline;
    @JsonKey(name: "nonRefundable")
    bool? nonRefundable;
    @JsonKey(name: "info")
    dynamic info;
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
class Meal {
    @JsonKey(name: "code")
    String? code;
    @JsonKey(name: "name")
    String? name;

    Meal({
        this.code,
        this.name,
    });

    factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

    Map<String, dynamic> toJson() => _$MealToJson(this);
}

@JsonSerializable()
class Price {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    double? basePrice;
    @JsonKey(name: "tax")
    int? tax;
    @JsonKey(name: "margin")
    int? margin;
    @JsonKey(name: "fees")
    int? fees;
    @JsonKey(name: "total")
    double? total;

    Price({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.fees,
        this.total,
    });

    factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

    Map<String, dynamic> toJson() => _$PriceToJson(this);
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
