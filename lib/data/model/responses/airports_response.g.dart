// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airports_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportsResponse _$AirportsResponseFromJson(Map<String, dynamic> json) =>
    AirportsResponse(
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

Map<String, dynamic> _$AirportsResponseToJson(AirportsResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      airports: (json['airports'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => Airport.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'airports': instance.airports,
    };

Airport _$AirportFromJson(Map<String, dynamic> json) => Airport(
      code: json['code'] as String?,
      iata: json['iata'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AirportToJson(Airport instance) => <String, dynamic>{
      'code': instance.code,
      'iata': instance.iata,
      'name': instance.name,
      'country': instance.country,
      'state': instance.state,
    };
