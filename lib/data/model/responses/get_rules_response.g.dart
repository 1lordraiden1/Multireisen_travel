// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rules_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRulesResponse _$GetRulesResponseFromJson(Map<String, dynamic> json) =>
    GetRulesResponse(
      accessToken: json['accessToken'] as String?,
      version: json['version'] as String?,
      serverDate: json['serverDate'] == null
          ? null
          : DateTime.parse(json['serverDate'] as String),
      server: json['server'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRulesResponseToJson(GetRulesResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      rules: json['rules'] == null
          ? null
          : Rules.fromJson(json['rules'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'rules': instance.rules,
    };

Rules _$RulesFromJson(Map<String, dynamic> json) => Rules(
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RulesToJson(Rules instance) => <String, dynamic>{
      'segments': instance.segments,
    };

Segment _$SegmentFromJson(Map<String, dynamic> json) => Segment(
      origin: json['origin'] == null
          ? null
          : Destination.fromJson(json['origin'] as Map<String, dynamic>),
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      cabinClass: json['cabinClass'] as String?,
      privateFare: json['privateFare'] as bool?,
      negotiatedFare: json['negotiatedFare'] as bool?,
      notvalid: json['notvalid'] == null
          ? null
          : Notvalid.fromJson(json['notvalid'] as Map<String, dynamic>),
      fareRules: (json['fareRules'] as List<dynamic>?)
          ?.map((e) => FareRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'cabinClass': instance.cabinClass,
      'privateFare': instance.privateFare,
      'negotiatedFare': instance.negotiatedFare,
      'notvalid': instance.notvalid,
      'fareRules': instance.fareRules,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

FareRule _$FareRuleFromJson(Map<String, dynamic> json) => FareRule(
      title: json['title'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$FareRuleToJson(FareRule instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
    };

Notvalid _$NotvalidFromJson(Map<String, dynamic> json) => Notvalid(
      before: json['before'] == null
          ? null
          : DateTime.parse(json['before'] as String),
      after: json['after'] == null
          ? null
          : DateTime.parse(json['after'] as String),
    );

Map<String, dynamic> _$NotvalidToJson(Notvalid instance) => <String, dynamic>{
      'before': instance.before?.toIso8601String(),
      'after': instance.after?.toIso8601String(),
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
