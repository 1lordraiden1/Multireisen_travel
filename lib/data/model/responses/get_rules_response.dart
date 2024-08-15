// To parse this JSON data, do
//
//     final getRulesResponse = getRulesResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_rules_response.g.dart';

GetRulesResponse getRulesResponseFromJson(String str) =>
    GetRulesResponse.fromJson(json.decode(str));

String getRulesResponseToJson(GetRulesResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetRulesResponse {
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

  GetRulesResponse({
    this.accessToken,
    this.version,
    this.serverDate,
    this.server,
    this.data,
    this.error,
  });

  factory GetRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRulesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRulesResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "rules")
  Rules? rules;

  Data({
    this.rules,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Rules {
  @JsonKey(name: "segments")
  List<Segment>? segments;

  Rules({
    this.segments,
  });

  factory Rules.fromJson(Map<String, dynamic> json) => _$RulesFromJson(json);

  Map<String, dynamic> toJson() => _$RulesToJson(this);
}

@JsonSerializable()
class Segment {
  @JsonKey(name: "origin")
  Destination? origin;
  @JsonKey(name: "destination")
  Destination? destination;
  @JsonKey(name: "cabinClass")
  String? cabinClass;
  @JsonKey(name: "privateFare")
  bool? privateFare;
  @JsonKey(name: "negotiatedFare")
  bool? negotiatedFare;
  @JsonKey(name: "notvalid")
  Notvalid? notvalid;
  @JsonKey(name: "fareRules")
  List<FareRule>? fareRules;

  Segment({
    this.origin,
    this.destination,
    this.cabinClass,
    this.privateFare,
    this.negotiatedFare,
    this.notvalid,
    this.fareRules,
  });

  factory Segment.fromJson(Map<String, dynamic> json) =>
      _$SegmentFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentToJson(this);
}

@JsonSerializable()
class Destination {
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "name")
  String? name;

  Destination({
    this.code,
    this.name,
  });

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@JsonSerializable()
class FareRule {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "text")
  String? text;

  FareRule({
    this.title,
    this.text,
  });

  factory FareRule.fromJson(Map<String, dynamic> json) =>
      _$FareRuleFromJson(json);

  Map<String, dynamic> toJson() => _$FareRuleToJson(this);
}

@JsonSerializable()
class Notvalid {
  @JsonKey(name: "before")
  DateTime? before;
  @JsonKey(name: "after")
  DateTime? after;

  Notvalid({
    this.before,
    this.after,
  });

  factory Notvalid.fromJson(Map<String, dynamic> json) =>
      _$NotvalidFromJson(json);

  Map<String, dynamic> toJson() => _$NotvalidToJson(this);
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
