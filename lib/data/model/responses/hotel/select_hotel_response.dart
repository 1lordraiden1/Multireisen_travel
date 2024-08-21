// To parse this JSON data, do
//
//     final selectHotelResponse = selectHotelResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:qfly/data/model/hotel/hotel.dart';

part 'select_hotel_response.g.dart';

SelectHotelResponse selectHotelResponseFromJson(String str) => SelectHotelResponse.fromJson(json.decode(str));

String selectHotelResponseToJson(SelectHotelResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SelectHotelResponse {
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

    SelectHotelResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory SelectHotelResponse.fromJson(Map<String, dynamic> json) => _$SelectHotelResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SelectHotelResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "rooms")
    List<Room>? rooms;
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "links")
    List<DataLink>? links;
    @JsonKey(name: "optionalServices")
    bool? optionalServices;
    @JsonKey(name: "requiredFields")
    List<String>? requiredFields;
    @JsonKey(name: "payModes")
    List<PayMode>? payModes;

    Data({
        this.itemId,
        this.rooms,
        this.properties,
        this.links,
        this.optionalServices,
        this.requiredFields,
        this.payModes,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class DataLink {
    @JsonKey(name: "rel")
    String? rel;
    @JsonKey(name: "method")
    String? method;
    @JsonKey(name: "href")
    String? href;

    DataLink({
        this.rel,
        this.method,
        this.href,
    });

    factory DataLink.fromJson(Map<String, dynamic> json) => _$DataLinkFromJson(json);

    Map<String, dynamic> toJson() => _$DataLinkToJson(this);
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
    @JsonKey(name: "facilities")
    List<Facility>? facilities;
    @JsonKey(name: "description")
    String? description;
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
        this.facilities,
        this.description,
        this.information,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => _$PropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Category {
    @JsonKey(name: "numeric")
    String? numeric;
    @JsonKey(name: "textual")
    dynamic textual;
    @JsonKey(name: "description")
    String? description;

    Category({
        this.numeric,
        this.textual,
        this.description,
    });

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Facility {
    @JsonKey(name: "text")
    String? text;

    Facility({
        this.text,
    });

    factory Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);

    Map<String, dynamic> toJson() => _$FacilityToJson(this);
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

/* @JsonSerializable()
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
    List<String>? remarks;
    @JsonKey(name: "links")
    List<RoomLink>? links;
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
} */

/* @JsonSerializable()
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
 */
/* @JsonSerializable()
class RoomLink {
    @JsonKey(name: "rel")
    String? rel;
    @JsonKey(name: "href")
    String? href;

    RoomLink({
        this.rel,
        this.href,
    });

    factory RoomLink.fromJson(Map<String, dynamic> json) => _$RoomLinkFromJson(json);

    Map<String, dynamic> toJson() => _$RoomLinkToJson(this);
} */

/* @JsonSerializable()
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
 */
/* @JsonSerializable()
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
} */

/* @JsonSerializable()
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
} */

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
