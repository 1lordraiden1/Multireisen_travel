// To parse this JSON data, do
//
//     final hotelDetailsResponse = hotelDetailsResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'hotel_details_response.g.dart';

HotelDetailsResponse hotelDetailsResponseFromJson(String str) => HotelDetailsResponse.fromJson(json.decode(str));

String hotelDetailsResponseToJson(HotelDetailsResponse data) => json.encode(data.toJson());

@JsonSerializable()
class HotelDetailsResponse {
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

    HotelDetailsResponse({
        this.accessToken,
        this.version,
        this.serverDate,
        this.server,
        this.data,
        this.error,
    });

    factory HotelDetailsResponse.fromJson(Map<String, dynamic> json) => _$HotelDetailsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$HotelDetailsResponseToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "itemId")
    String? itemId;
    @JsonKey(name: "properties")
    Properties? properties;
    @JsonKey(name: "links")
    List<Link>? links;

    Data({
        this.itemId,
        this.properties,
        this.links,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
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
