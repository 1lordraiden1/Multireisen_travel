// To parse this JSON data, do
//
//     final hotelResponse = hotelResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:qfly/data/model/hotel/hotel.dart';

part 'hotel_response.g.dart';

HotelResponse hotelResponseFromJson(String str) => HotelResponse.fromJson(json.decode(str));

String hotelResponseToJson(HotelResponse data) => json.encode(data.toJson());

@JsonSerializable()
class HotelResponse {
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

    HotelResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory HotelResponse.fromJson(Map<String, dynamic> json) => _$HotelResponseFromJson(json);

    Map<String, dynamic> toJson() => _$HotelResponseToJson(this);
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
    DataProperties? properties;
    @JsonKey(name: "filters")
    Filters? filters;
    @JsonKey(name: "markers")
    List<Marker>? markers;
    @JsonKey(name: "entities")
    List<Hotel>? entities;
    @JsonKey(name: "links")
    List<Link>? links;

    Data({
        this.dataClass,
        this.type,
        this.status,
        this.properties,
        this.filters,
        this.markers,
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
    @JsonKey(name: "rooms")
    List<Room>? rooms;
    @JsonKey(name: "properties")
    EntityProperties? properties;
    @JsonKey(name: "links")
    List<Link>? links;

    Entity({
        this.itemId,
        this.rooms,
        this.properties,
        this.links,
    });

    factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

    Map<String, dynamic> toJson() => _$EntityToJson(this);
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
class EntityProperties {
    @JsonKey(name: "hotelId")
    String? hotelId;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "address")
    String? address;
    @JsonKey(name: "phone")
    String? phone;
    @JsonKey(name: "category")
    PropertiesCategory? category;
    @JsonKey(name: "location")
    Location? location;
    @JsonKey(name: "images")
    List<Image>? images;
    @JsonKey(name: "information")
    List<dynamic>? information;

    EntityProperties({
        this.hotelId,
        this.name,
        this.address,
        this.phone,
        this.category,
        this.location,
        this.images,
        this.information,
    });

    factory EntityProperties.fromJson(Map<String, dynamic> json) => _$EntityPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$EntityPropertiesToJson(this);
}

@JsonSerializable()
class PropertiesCategory {
    @JsonKey(name: "numeric")
    dynamic numeric;
    @JsonKey(name: "textual")
    dynamic textual;

    PropertiesCategory({
        this.numeric,
        this.textual,
    });

    factory PropertiesCategory.fromJson(Map<String, dynamic> json) => _$PropertiesCategoryFromJson(json);

    Map<String, dynamic> toJson() => _$PropertiesCategoryToJson(this);
}

@JsonSerializable()
class Image {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "width")
    String? width;
    @JsonKey(name: "height")
    String? height;
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
    RoomPrice? price;
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
class RoomPrice {
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

    RoomPrice({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.fees,
        this.total,
    });

    factory RoomPrice.fromJson(Map<String, dynamic> json) => _$RoomPriceFromJson(json);

    Map<String, dynamic> toJson() => _$RoomPriceToJson(this);
}

@JsonSerializable()
class View {
    @JsonKey(name: "code")
    dynamic code;
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
    @JsonKey(name: "categories")
    List<CategoryElement>? categories;

    Filters({
        this.price,
        this.categories,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

    Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class CategoryElement {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "value")
    int? value;

    CategoryElement({
        this.id,
        this.value,
    });

    factory CategoryElement.fromJson(Map<String, dynamic> json) => _$CategoryElementFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryElementToJson(this);
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
class Marker {
    @JsonKey(name: "type")
    String? type;
    @JsonKey(name: "itemid")
    String? itemid;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "geocodes")
    Geocodes? geocodes;

    Marker({
        this.type,
        this.itemid,
        this.name,
        this.geocodes,
    });

    factory Marker.fromJson(Map<String, dynamic> json) => _$MarkerFromJson(json);

    Map<String, dynamic> toJson() => _$MarkerToJson(this);
}

@JsonSerializable()
class Geocodes {
    @JsonKey(name: "lat")
    String? lat;
    @JsonKey(name: "lon")
    String? lon;

    Geocodes({
        this.lat,
        this.lon,
    });

    factory Geocodes.fromJson(Map<String, dynamic> json) => _$GeocodesFromJson(json);

    Map<String, dynamic> toJson() => _$GeocodesToJson(this);
}

@JsonSerializable()
class DataProperties {
    @JsonKey(name: "totalcount")
    int? totalcount;
    @JsonKey(name: "filteredcount")
    int? filteredcount;
    @JsonKey(name: "displaycount")
    int? displaycount;
    @JsonKey(name: "pages")
    int? pages;
    @JsonKey(name: "page")
    int? page;

    DataProperties({
        this.totalcount,
        this.filteredcount,
        this.displaycount,
        this.pages,
        this.page,
    });

    factory DataProperties.fromJson(Map<String, dynamic> json) => _$DataPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$DataPropertiesToJson(this);
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
