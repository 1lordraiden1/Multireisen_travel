// To parse this JSON data, do
//
//     final bookingHotelDetailsResponse = bookingHotelDetailsResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'booking_hotel_details_response.g.dart';

BookingHotelDetailsResponse bookingHotelDetailsResponseFromJson(String str) => BookingHotelDetailsResponse.fromJson(json.decode(str));

String bookingHotelDetailsResponseToJson(BookingHotelDetailsResponse data) => json.encode(data.toJson());

@JsonSerializable()
class BookingHotelDetailsResponse {
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

    BookingHotelDetailsResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory BookingHotelDetailsResponse.fromJson(Map<String, dynamic> json) => _$BookingHotelDetailsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$BookingHotelDetailsResponseToJson(this);
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
    @JsonKey(name: "hotelDetails")
    HotelDetails? hotelDetails;
    @JsonKey(name: "rooms")
    List<Room>? rooms;
    @JsonKey(name: "links")
    List<Link>? links;

    Entity({
        this.properties,
        this.hotelDetails,
        this.rooms,
        this.links,
    });

    factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

    Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class HotelDetails {
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

    HotelDetails({
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

    factory HotelDetails.fromJson(Map<String, dynamic> json) => _$HotelDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
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
    @JsonKey(name: "checkin")
    DateTime? checkin;
    @JsonKey(name: "checkout")
    DateTime? checkout;
    @JsonKey(name: "cxlPolicy")
    CxlPolicy? cxlPolicy;
    @JsonKey(name: "price")
    PurplePrice? price;
    @JsonKey(name: "status")
    Status? status;

    EntityProperties({
        this.bookingItemId,
        this.type,
        this.bookingNumber,
        this.number,
        this.checkin,
        this.checkout,
        this.cxlPolicy,
        this.price,
        this.status,
    });

    factory EntityProperties.fromJson(Map<String, dynamic> json) => _$EntityPropertiesFromJson(json);

    Map<String, dynamic> toJson() => _$EntityPropertiesToJson(this);
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
class PurplePrice {
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "basePrice")
    String? basePrice;
    @JsonKey(name: "tax")
    String? tax;
    @JsonKey(name: "margin")
    String? margin;
    @JsonKey(name: "discount")
    String? discount;
    @JsonKey(name: "optionalServices")
    String? optionalServices;
    @JsonKey(name: "fees")
    String? fees;
    @JsonKey(name: "total")
    String? total;

    PurplePrice({
        this.currency,
        this.basePrice,
        this.tax,
        this.margin,
        this.discount,
        this.optionalServices,
        this.fees,
        this.total,
    });

    factory PurplePrice.fromJson(Map<String, dynamic> json) => _$PurplePriceFromJson(json);

    Map<String, dynamic> toJson() => _$PurplePriceToJson(this);
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
class Room {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "meal")
    Meal? meal;
    @JsonKey(name: "roomtype")
    Meal? roomtype;
    @JsonKey(name: "view")
    View? view;
    @JsonKey(name: "additionalFees")
    List<dynamic>? additionalFees;
    @JsonKey(name: "priceInfo")
    String? priceInfo;
    @JsonKey(name: "sharingBedding")
    bool? sharingBedding;
    @JsonKey(name: "remarks")
    List<String>? remarks;
    @JsonKey(name: "originalItemId")
    String? originalItemId;
    @JsonKey(name: "originalSolutionId")
    String? originalSolutionId;

    Room({
        this.itemId,
        this.name,
        this.meal,
        this.roomtype,
        this.view,
        this.additionalFees,
        this.priceInfo,
        this.sharingBedding,
        this.remarks,
        this.originalItemId,
        this.originalSolutionId,
    });

    factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

    Map<String, dynamic> toJson() => _$RoomToJson(this);
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
class DataProperties {
    @JsonKey(name: "bookingId")
    String? bookingId;
    @JsonKey(name: "created")
    DateTime? created;
    @JsonKey(name: "price")
    FluffyPrice? price;
    @JsonKey(name: "passengers")
    List<dynamic>? passengers;

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
