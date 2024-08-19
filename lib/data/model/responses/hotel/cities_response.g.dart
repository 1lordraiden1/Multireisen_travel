// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponse _$CitiesResponseFromJson(Map<String, dynamic> json) =>
    CitiesResponse(
      accessToken: json['accessToken'] as String?,
      version: json['version'] as String?,
      serverDate: json['serverDate'] == null
          ? null
          : DateTime.parse(json['serverDate'] as String),
      server: json['server'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CitiesResponseToJson(CitiesResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'properties': instance.properties,
      'cities': instance.cities,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      code: json['code'] as String?,
      name: json['name'] as String?,
      country: $enumDecodeNullable(_$CountryEnumMap, json['country']),
      state: json['state'] as String?,
      geocode: json['geocode'] == null
          ? null
          : Geocode.fromJson(json['geocode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'country': _$CountryEnumMap[instance.country],
      'state': instance.state,
      'geocode': instance.geocode,
    };

const _$CountryEnumMap = {
  Country.DE: 'DE',
};

Geocode _$GeocodeFromJson(Map<String, dynamic> json) => Geocode(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$GeocodeToJson(Geocode instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      totalcount: (json['totalcount'] as num?)?.toInt(),
      displaycount: (json['displaycount'] as num?)?.toInt(),
      pages: (json['pages'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'totalcount': instance.totalcount,
      'displaycount': instance.displaycount,
      'pages': instance.pages,
      'page': instance.page,
    };
