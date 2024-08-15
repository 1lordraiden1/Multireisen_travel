// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'void_ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoidTicketResponse _$VoidTicketResponseFromJson(Map<String, dynamic> json) =>
    VoidTicketResponse(
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

Map<String, dynamic> _$VoidTicketResponseToJson(VoidTicketResponse instance) =>
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
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'properties': instance.properties,
      'success': instance.success,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      bookingId: json['bookingId'] as String?,
      bookingItemId: json['bookingItemId'] as String?,
      type: json['type'] as String?,
      bookingNumber: json['bookingNumber'] as String?,
      number: json['number'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'bookingItemId': instance.bookingItemId,
      'type': instance.type,
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
