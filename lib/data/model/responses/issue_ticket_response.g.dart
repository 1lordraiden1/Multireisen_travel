// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueTicketResponse _$IssueTicketResponseFromJson(Map<String, dynamic> json) =>
    IssueTicketResponse(
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

Map<String, dynamic> _$IssueTicketResponseToJson(
        IssueTicketResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      properties: json['properties'] == null
          ? null
          : Properties.fromJson(json['properties'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'properties': instance.properties,
      'success': instance.success,
      'messages': instance.messages,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      text: json['text'] as String?,
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      type: json['type'] as String?,
      bookingId: json['bookingId'] as String?,
      bookingItemId: json['bookingItemId'] as String?,
      bookingNumber: json['bookingNumber'] as String?,
      number: json['number'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'type': instance.type,
      'bookingId': instance.bookingId,
      'bookingItemId': instance.bookingItemId,
      'bookingNumber': instance.bookingNumber,
      'number': instance.number,
      'status': instance.status,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      booking: json['booking'] as String?,
      document: json['document'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'booking': instance.booking,
      'document': instance.document,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
